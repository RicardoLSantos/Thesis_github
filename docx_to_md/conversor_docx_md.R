# Conversor de DOCX para Markdown em R
# Preserva tabulação, índice, links e imagens

# Instalar pacotes necessários (descomente se precisar instalar)
# install.packages("officer")
# install.packages("xml2")
# install.packages("stringr")
# install.packages("magrittr")
# install.packages("fs")
# install.packages("data.table")
# install.packages("flextable")

# Carregar bibliotecas
library(officer)
library(xml2)
library(stringr)
library(magrittr)
library(fs)
library(data.table)
library(flextable)

#' Converte um arquivo DOCX para Markdown
#'
#' @param input_file Caminho para o arquivo DOCX de entrada
#' @param output_file Caminho para o arquivo MD de saída
#' @param extract_images Booleano indicando se as imagens devem ser extraídas (padrão: TRUE)
#' @param images_dir Diretório para salvar as imagens extraídas (padrão: "images")
#'
#' @return Caminho para o arquivo MD criado
#'
docx_to_markdown <- function(input_file, output_file = NULL, extract_images = TRUE, images_dir = "images") {
  # Verificar se o arquivo de entrada existe
  if (!file.exists(input_file)) {
    stop("Arquivo de entrada não encontrado: ", input_file)
  }
  
  # Definir arquivo de saída se não especificado
  if (is.null(output_file)) {
    output_file <- fs::path_ext_set(input_file, "md")
  }
  
  # Criar diretório para imagens se necessário
  if (extract_images) {
    if (!dir.exists(images_dir)) {
      dir.create(images_dir, recursive = TRUE)
    }
  }
  
  # Ler o documento DOCX
  doc <- read_docx(input_file)
  
  # Extrair conteúdo do documento
  content <- docx_summary(doc)
  
  # Inicializar o conteúdo Markdown
  md_content <- character()
  
  # Rastrear o estado atual do texto
  current_state <- list(
    heading_level = 0,
    is_bold = FALSE,
    is_italic = FALSE,
    is_list = FALSE,
    list_level = 0,
    list_index = 0,
    toc_entries = list()
  )
  
  # Extrair e processar imagens
  image_index <- 0
  image_mappings <- list()
  
  if (extract_images) {
    # Extrair imagens do documento
    doc_folder <- tempfile()
    dir.create(doc_folder)
    
    tryCatch({
      # Usar unzip para extrair o conteúdo do DOCX (que é um arquivo ZIP)
      unzip(input_file, exdir = doc_folder)
      
      # Procurar por imagens no diretório word/media
      media_dir <- file.path(doc_folder, "word", "media")
      if (dir.exists(media_dir)) {
        image_files <- list.files(media_dir, full.names = TRUE)
        
        for (img_file in image_files) {
          image_index <- image_index + 1
          
          # Obter extensão do arquivo
          ext <- tolower(fs::path_ext(img_file))
          
          # Criar novo nome para a imagem
          new_img_name <- paste0("image_", image_index, ".", ext)
          new_img_path <- file.path(images_dir, new_img_name)
          
          # Copiar a imagem para o diretório de destino
          file.copy(img_file, new_img_path, overwrite = TRUE)
          
          # Adicionar ao mapeamento de imagens
          original_name <- basename(img_file)
          image_mappings[[original_name]] <- file.path(images_dir, new_img_name)
        }
      }
    }, finally = {
      unlink(doc_folder, recursive = TRUE)
    })
  }
  
  # Processar tabelas
  process_tables <- function(doc) {
    table_content <- list()
    table_index <- 0
    
    # Extrair tabelas do documento
    for (i in seq_along(doc$content)) {
      if (inherits(doc$content[[i]], "wml_tbl")) {
        table_index <- table_index + 1
        tbl <- doc$content[[i]]
        
        # Converter para flextable
        ft <- officer::body_add_flextable(read_docx(), flextable(tbl))
        
        # Extrair dados da tabela
        table_rows <- list()
        row_count <- length(tbl$tbl_rows)
        
        for (r in 1:row_count) {
          row_cells <- tbl$tbl_rows[[r]]$cell_content
          row_text <- sapply(row_cells, function(cell) {
            if (length(cell$p) > 0) {
              paste(sapply(cell$p, function(p) p$text), collapse = " ")
            } else {
              ""
            }
          })
          table_rows[[r]] <- row_text
        }
        
        # Determinar número máximo de colunas
        max_cols <- max(sapply(table_rows, length))
        
        # Padronizar número de colunas
        table_rows <- lapply(table_rows, function(row) {
          if (length(row) < max_cols) {
            c(row, rep("", max_cols - length(row)))
          } else {
            row
          }
        })
        
        # Converter para formato markdown
        md_table <- c()
        
        # Cabeçalhos
        header <- paste0("| ", paste(table_rows[[1]], collapse = " | "), " |")
        md_table <- c(md_table, header)
        
        # Separador
        separator <- paste0("| ", paste(rep("---", max_cols), collapse = " | "), " |")
        md_table <- c(md_table, separator)
        
        # Linhas de dados
        if (row_count > 1) {
          for (r in 2:row_count) {
            row_md <- paste0("| ", paste(table_rows[[r]], collapse = " | "), " |")
            md_table <- c(md_table, row_md)
          }
        }
        
        table_content[[table_index]] <- md_table
      }
    }
    
    return(table_content)
  }
  
  # Extrair tabelas
  tables <- process_tables(doc)
  
  # Processar cada elemento do conteúdo
  current_table_index <- 0
  
  for (i in seq_len(nrow(content))) {
    row <- content[i, ]
    text <- row$text
    style_name <- row$style_name
    level <- row$level
    content_type <- row$content_type
    
    # Pular linhas vazias ou nulas
    if (is.na(text) || text == "") {
      next
    }
    
    # Verificar se é uma tabela
    if (!is.na(content_type) && content_type == "table cell") {
      # Se for a primeira célula de uma nova tabela
      if (!identical(row$doc_index, content$doc_index[i-1]) || i == 1) {
        current_table_index <- current_table_index + 1
        
        # Inserir a tabela processada anteriormente
        if (current_table_index <= length(tables)) {
          md_content <- c(md_content, "", tables[[current_table_index]], "")
        }
      }
      
      # Pular, pois a tabela já foi processada
      next
    }
    
    # Processar cabeçalhos
    if (!is.na(style_name) && grepl("^heading", style_name, ignore.case = TRUE)) {
      heading_level <- as.integer(str_extract(style_name, "\\d+"))
      
      if (!is.na(heading_level)) {
        # Adicionar entrada ao índice
        current_state$toc_entries <- c(
          current_state$toc_entries, 
          list(list(level = heading_level, text = text))
        )
        
        # Adicionar cabeçalho ao markdown
        heading_marks <- paste(rep("#", heading_level), collapse = "")
        md_content <- c(md_content, paste0("\n", heading_marks, " ", text, "\n"))
        
        # Atualizar estado
        current_state$heading_level <- heading_level
        next
      }
    }
    
    # Processar listas
    if (!is.na(level) && level > 0) {
      # Determinar se é uma nova lista ou continuação
      if (!current_state$is_list || current_state$list_level != level) {
        current_state$is_list <- TRUE
        current_state$list_level <- level
        current_state$list_index <- 1
      } else {
        current_state$list_index <- current_state$list_index + 1
      }
      
      # Adicionar indentação apropriada para o nível da lista
      indent <- paste(rep("  ", level - 1), collapse = "")
      
      # Determinar se é uma lista ordenada ou não ordenada (simplificado)
      # Aqui assumimos não ordenada, mas pode ser aprimorado
      bullet <- "-"
      
      md_content <- c(md_content, paste0(indent, bullet, " ", text))
      next
    } else {
      # Resetar estado da lista se não estamos mais em uma
      if (current_state$is_list) {
        current_state$is_list <- FALSE
        current_state$list_level <- 0
        current_state$list_index <- 0
        md_content <- c(md_content, "")  # Linha em branco após lista
      }
    }
    
    # Processar estilos de texto (negrito, itálico, etc.)
    # Aqui usamos uma abordagem simplificada, poderíamos expandir para outros estilos
    
    # Verificar propriedades de estilo no conteúdo
    if (!is.na(row$bold) && row$bold) {
      text <- paste0("**", text, "**")
    }
    
    if (!is.na(row$italic) && row$italic) {
      text <- paste0("*", text, "*")
    }
    
    # Processar hiperlinks
    if (!is.na(row$hyperlink) && row$hyperlink != "") {
      text <- paste0("[", text, "](", row$hyperlink, ")")
    }
    
    # Processar imagens (baseado nas referências encontradas no texto)
    # Esta é uma simplificação, pode precisar de lógica mais sofisticada
    if (extract_images && length(image_mappings) > 0) {
      for (orig_name in names(image_mappings)) {
        if (grepl(orig_name, text, fixed = TRUE)) {
          img_path <- image_mappings[[orig_name]]
          # Substituir referência à imagem por sintaxe markdown
          text <- paste0("![", basename(img_path), "](", img_path, ")")
          break
        }
      }
    }
    
    # Adicionar texto ao markdown
    md_content <- c(md_content, text)
  }
  
  # Gerar índice (TOC)
  if (length(current_state$toc_entries) > 0) {
    toc <- "# Índice\n\n"
    
    for (entry in current_state$toc_entries) {
      # Excluir o próprio título do índice
      if (entry$text == "Índice") {
        next
      }
      
      # Criar link interno (âncora)
      anchor <- tolower(gsub("[^a-zA-Z0-9]+", "-", entry$text))
      indent <- paste(rep("  ", entry$level - 1), collapse = "")
      toc <- paste0(toc, indent, "- [", entry$text, "](#", anchor, ")\n")
    }
    
    # Inserir o índice no início do documento
    md_content <- c(toc, "\n---\n", md_content)
  }
  
  # Escrever conteúdo no arquivo de saída
  writeLines(md_content, output_file)
  
  # Retornar caminho do arquivo de saída
  return(output_file)
}

# Função para testar o conversor com um arquivo de exemplo
test_converter <- function(input_file, output_file = NULL) {
  if (!file.exists(input_file)) {
    stop("Arquivo de teste não encontrado: ", input_file)
  }
  
  resultado <- docx_to_markdown(input_file, output_file)
  print(paste("Arquivo convertido com sucesso:", resultado))
  
  # Verifica se o arquivo de saída foi criado
  if (file.exists(resultado)) {
    print(paste("Tamanho do arquivo de saída:", file.size(resultado), "bytes"))
    
    # Verifica se o diretório de imagens foi criado
    images_dir <- "images"
    if (dir.exists(images_dir)) {
      image_files <- list.files(images_dir, full.names = TRUE)
      print(paste("Número de imagens extraídas:", length(image_files)))
    }
    
    return(TRUE)
  } else {
    warning("Arquivo de saída não foi criado")
    return(FALSE)
  }
}

# Exemplo de uso:
# resultado <- docx_to_markdown("meu_documento.docx", "meu_documento.md")
# print(paste("Arquivo convertido:", resultado))
#
# # Ou usar a função de teste:
# test_converter("meu_documento.docx")
