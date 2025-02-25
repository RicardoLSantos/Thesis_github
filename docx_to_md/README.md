# Conversor de DOCX para Markdown em R

Este pacote oferece uma solução em R para converter documentos do Microsoft Word (.docx) para o formato Markdown (.md), preservando elementos importantes como:

- Estrutura de cabeçalhos
- Formatação de texto (negrito, itálico)
- Índice (TOC)
- Links
- Imagens
- Tabulação
- Tabelas

## Requisitos

Para utilizar este conversor, você precisará instalar os seguintes pacotes R:

```r
install.packages(c("officer", "xml2", "stringr", "magrittr", "fs", "data.table", "flextable"))
```

## Instalação

1. Clone ou baixe este repositório
2. Carregue as funções em seu ambiente R:

```r
source("conversor_docx_md.R")
```

## Uso Básico

```r
# Converter um único arquivo
resultado <- docx_to_markdown(
  input_file = "documento.docx",  # Arquivo DOCX de entrada
  output_file = "documento.md",   # Arquivo MD de saída (opcional)
  extract_images = TRUE,          # Extrair imagens do documento
  images_dir = "imagens"          # Pasta para armazenar as imagens
)
```

## Converter Múltiplos Arquivos

```r
# Função auxiliar para converter todos os arquivos DOCX em uma pasta
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

# Exemplo:
resultados <- converter_pasta("pasta_com_docx", "pasta_saida_md")
```

## Detalhes da Implementação

### Preservação de Elementos

1. **Cabeçalhos**: Os cabeçalhos são identificados e convertidos para a sintaxe Markdown (`#`, `##`, etc.)
2. **Formatação de Texto**: Negrito e itálico são preservados
3. **Índice (TOC)**: Um índice é gerado automaticamente com base nos cabeçalhos encontrados
4. **Links**: Os hyperlinks são convertidos para a sintaxe Markdown `[texto](url)`
5. **Imagens**: As imagens são extraídas do arquivo .docx e salvas em uma pasta separada, com referências adequadas no Markdown
6. **Tabelas**: As tabelas são convertidas para a sintaxe de tabelas do Markdown
7. **Listas**: As listas são preservadas com a indentação adequada

### Limitações Atuais

- A formatação avançada de tabelas pode não ser preservada completamente
- Comentários e controle de alterações não são suportados
- Fórmulas matemáticas complexas podem não ser convertidas adequadamente
- Alguns elementos de layout avançados podem não ser preservados

## Funções Principais

### `docx_to_markdown()`

Função principal para converter um documento DOCX para Markdown.

**Parâmetros:**
- `input_file`: Caminho para o arquivo DOCX de entrada
- `output_file`: Caminho para o arquivo MD de saída (opcional)
- `extract_images`: Booleano indicando se as imagens devem ser extraídas (padrão: TRUE)
- `images_dir`: Diretório para salvar as imagens extraídas (padrão: "images")

**Retorno:**
- Caminho para o arquivo MD criado

### `test_converter()`

Função para testar o conversor com um arquivo de exemplo.

**Parâmetros:**
- `input_file`: Caminho para o arquivo DOCX de teste
- `output_file`: Caminho para o arquivo MD de saída (opcional)

**Retorno:**
- Booleano indicando se a conversão foi bem-sucedida

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Reportar bugs
2. Sugerir melhorias
3. Enviar pull requests

## Licença

Este projeto está licenciado sob a licença MIT.
