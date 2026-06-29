import codecs

file_path = r"c:\Users\teste\Desktop\p.v  facas\index.html"

# Ler o arquivo com encoding correto
with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
    content = f.read()

# Substituições de caracteres mal codificados
replacements = {
    'Ã§': 'ç',
    'Ã£': 'ã',
    'Ã©': 'é',
    'Ãº': 'ú',
    'Ã­': 'í',
    'Ã³': 'ó',
    'Ã¡': 'á',
    'Ãµ': 'õ',
    'Ã¢': 'â',
    'Ãª': 'ê',
    'Ã´': 'ô',
    'Ã‡': 'Ç',
    'Ã‰': 'É',
    'Ãš': 'Ú',
    'Ã"': 'Ó',
    'Ã': 'Á',
    'Ã§Ã£': 'ção',
    'Ã§Ã£o': 'ção',
    'Ã§Ãµ': 'çõ',
    '??': 'ã',
    '?': ''
}

for old, new in replacements.items():
    content = content.replace(old, new)

# Salvar com UTF-8 BOM
with open(file_path, 'w', encoding='utf-8-sig') as f:
    f.write(content)

print("✅ Encoding corrigido com sucesso!")
