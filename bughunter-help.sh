#!/bin/bash

echo -e "\e[1;36m=========================================="
echo -e "     🔍 Bug Hunters Toolkit Help Menu"
echo -e "     📦 Made by RootWraith"
echo -e "==========================================\e[0m"

echo -e "\n\e[1;33m🔧 Tools Installed via APT/GO (Global Run)\e[0m"
cat << EOF
▶ nmap          → nmap -sV target.com
▶ masscan       → masscan -p1-65535 192.168.1.0/24
▶ whois         → whois example.com
▶ zmap          → zmap -p 80 192.168.0.0/24
▶ dig/nslookup  → dig example.com
▶ ffuf          → ffuf -u https://site.com/FUZZ -w wordlist.txt
▶ httpx         → httpx -l urls.txt
▶ subfinder     → subfinder -d example.com
▶ nuclei        → nuclei -u https://site.com
▶ naabu         → naabu -host example.com
▶ gau           → gau example.com
▶ dalfox        → dalfox url https://target.com
▶ kxss          → cat urls.txt | kxss
▶ burpsuite     → burpsuite
EOF

echo -e "\n\e[1;35m📂 Tools Cloned in /opt/bughunter-tools (Run via Python)\e[0m"
cat << EOF
▶ sqlmap        → cd /opt/bughunter-tools/sqlmap && python3 sqlmap.py -u "http://site.com?id=1"
▶ XSStrike      → cd /opt/bughunter-tools/XSStrike && python3 xsstrike.py
▶ Arjun         → cd /opt/bughunter-tools/Arjun && python3 arjun.py -u https://site.com -m GET
▶ LinkFinder    → cd /opt/bughunter-tools/LinkFinder && python3 linkfinder.py -i https://site.com -o cli
▶ ParamSpider   → cd /opt/bughunter-tools/ParamSpider && python3 paramspider.py --domain example.com
EOF

echo -e "\n\e[1;32m💡 Tips:\e[0m"
echo "• Add aliases to ~/.bashrc to run tools like 'sqlmap' from anywhere"
echo "• Example: alias sqlmap='python3 /opt/bughunter-tools/sqlmap/sqlmap.py'"
echo "• After editing bashrc, run: source ~/.bashrc"

echo -e "\n\e[1;36mHappy Hacking, Bug Hunter!\e[0m 💀"
