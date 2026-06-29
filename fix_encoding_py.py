# -*- coding: utf-8 -*-
import codecs

index_path = r"c:\Users\teste\Desktop\p.v  facas\index.html"

# Ler o arquivo
with codecs.open(index_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Corrigir os caracteres mal codificados
content = content.replace('vocÃª', 'você')
content = content.replace('bÃ´nus', 'bônus')

# Salvar o arquivo
with codecs.open(index_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Encoding corrigido com sucesso!")
