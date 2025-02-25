# Exemplo de uso do conversor DOCX para Markdown
# Este script demonstra como usar o conversor que desenvolvemos

# Carregando o script do conversor
source("conversor_docx_md.R")

# Configurações
input_file <- "exemplo.docx"  # Substitua pelo caminho do seu arquivo DOCX
output_file <- "exemplo.md"   # Arquivo de saída (opcional)
images_dir <- "imagens"       # Pasta para armazenar as imagens extraídas

# Executar a conversão
resultado <- docx_to_markdown(
  input_file = input_file,
  output_file = output_file,
  extract_images = TRUE,
  images_dir = images_dir
)

# Informar o usuário sobre o resultado
cat("Conversão concluída!\n")
cat("Arquivo Markdown gerado:", resultado, "\n")

# Para automatizar a conversão de múltiplos arquivos:
converter_pasta <- function(pasta_input, pasta_output = NULL, padrao = "*.docx") {
  # Obter lista de arquivos DOCX na pasta de entrada
  arquivos_docx <- list.files(pasta_input, pattern = padrao, full.names = TRUE)
  
  # Criar pasta de saída se não existir
  if (!is.null(pasta_output) && !dir.exists(pasta_output)) {
    dir.create(pasta_output, recursive = TRUE)
  }
  
  # Converter cada arquivo
  resultados <- list()
  for (arquivo in arquivos_docx) {
    nome_base <- basename(arquivo)
    nome_md <- fs::path_ext_set(nome_base, "md")
    
    if (!is.null(pasta_output)) {
      saida <- file.path(pasta_output, nome_md)
    } else {
      saida <- fs::path_ext_set(arquivo, "md")
    }
    
    cat("Convertendo:", nome_base, "...\n")
    try({
      resultado <- docx_to_markdown(arquivo, saida)
      resultados[[arquivo]] <- resultado
    })
  }
  
  return(resultados)
}

# Exemplo de uso da função para converter múltiplos arquivos:
# resultados <- converter_pasta("pasta_com_docx", "pasta_saida_md")
