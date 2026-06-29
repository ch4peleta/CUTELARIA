# -*- coding: utf-8 -*-
import re

# Ler os arquivos
with open('index_backup_2025_11_25.html', 'r', encoding='utf-8') as f:
    backup_content = f.read()

with open('secao3_scanner.html', 'r', encoding='utf-8') as f:
    section3_content = f.read()

# Padrão para encontrar a Seção 3 antiga
pattern = r'(    <!-- SEÇÃO 3: POR QUE ESCOLHER -->.*?    </section>)\r?\n\r?\n(    <!-- SEÇÃO 4: BÔNUS EXCLUSIVOS -->)'

# Substituir pela nova Seção 3
replacement = section3_content + '\r\n\r\n\\2'
new_content = re.sub(pattern, replacement, backup_content, flags=re.DOTALL)

# Salvar o arquivo
with open('index.html', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Secao 3 com scanner inserida com sucesso!")
