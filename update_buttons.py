import re
import os

file_path = r"c:\Users\teste\Desktop\p.v  facas\index.html"

if not os.path.exists(file_path):
    print(f"Error: File not found at {file_path}")
    exit(1)

try:
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace Basic Plan button
    # Pattern: <a href="upsell.html" class="cta-button primary pulse reveal">COMPRAR\s+AGORA</a>
    new_content = re.sub(
        r'(<a href="upsell\.html" class="cta-button primary pulse reveal">)\s*COMPRAR\s+AGORA\s*(</a>)',
        r'\1QUERO O BÁSICO\2',
        content
    )
    
    if new_content == content:
        print("Warning: Basic Plan button pattern not found.")
    else:
        print("Basic Plan button updated.")
        content = new_content

    # Replace Premium Plan button
    # Pattern: <a href="https://pay.kiwify.com.br/4u00I7u" class="cta-button primary pulse reveal">QUERO ACESSO\s+VITALÍCIO</a>
    new_content = re.sub(
        r'(<a href="https://pay\.kiwify\.com\.br/4u00I7u" class="cta-button primary pulse reveal">)\s*QUERO ACESSO\s+VITALÍCIO\s*(</a>)',
        r'\1GARANTIR O PREMIUM\2',
        content
    )
    
    if new_content == content:
        print("Warning: Premium Plan button pattern not found.")
    else:
        print("Premium Plan button updated.")
        content = new_content

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

    print("Replacements complete.")

except Exception as e:
    print(f"An error occurred: {e}")
