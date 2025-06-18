#!/bin/bash

# ===========================
#  BUG HUNTERS TOOLKIT MENU
# ===========================

# Colors
colors=("\e[31m" "\e[32m" "\e[33m" "\e[34m" "\e[35m" "\e[36m")
color_reset="\e[0m"
color_index=0

banner() {
  clear
  color=${colors[$color_index]}
  ((color_index=(color_index+1)%${#colors[@]}))
  echo -e "${color}"
  cat << "EOF"

  _           _       _              _             
 | |         | |     | |            | |            
 | |__   __ _| |_ ___| |__   ___  __| | ___  _ __  
 | '_ \ / _` | __/ __| '_ \ / _ \/ _` |/ _ \| '_ \ 
 | |_) | (_| | || (__| | | |  __/ (_| | (_) | | | |
 |_.__/ \__,_|\__\___|_| |_|\___|\__,_|\___/|_| |_|
                                                 
             This is for bug bounty hunter        
               made by RootWraith                 
EOF
  echo -e "${color_reset}"
}

# Basic dependency check
function check_requirements() {
  echo "🔍 Checking and installing required dependencies..."
  for pkg in python3 python3-pip git curl wget snapd golang; do
    if ! command -v $pkg &>/dev/null; then
      echo "📦 Installing $pkg..."
      apt install -y $pkg
    else
      echo "✅ $pkg already installed."
    fi
  done
  export PATH="$PATH:$(go env GOPATH)/bin"
}

# Tools list: name -> install command or function
TOOLS=(
  "nmap:apt install -y nmap"
  "masscan:apt install -y masscan"
  "whois:apt install -y whois"
  "zmap:apt install -y zmap"
  "dnsutils:apt install -y dnsutils"
  "ffuf:go install github.com/ffuf/ffuf/v2@latest"
  "httpx:go install github.com/projectdiscovery/httpx/cmd/httpx@latest"
  "subfinder:go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
  "nuclei:go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
  "naabu:go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
  "gau:go install github.com/lc/gau/v2/cmd/gau@latest"
  "dalfox:go install github.com/hahwul/dalfox/v2@latest"
  "kxss:go install github.com/Emoe/kxss@latest"
  "sqlmap:git clone https://github.com/sqlmapproject/sqlmap.git /opt/bughunter-tools/sqlmap"
  "XSStrike:git clone https://github.com/s0md3v/XSStrike.git /opt/bughunter-tools/XSStrike"
  "Arjun:git clone https://github.com/s0md3v/Arjun.git /opt/bughunter-tools/Arjun"
  "LinkFinder:git clone https://github.com/GerbenJavado/LinkFinder.git /opt/bughunter-tools/LinkFinder"
  "ParamSpider:git clone https://github.com/devanshbatham/ParamSpider.git /opt/bughunter-tools/ParamSpider"
  "burpsuite:snap install burpsuite"
)

mkdir -p /opt/bughunter-tools

# Start script
check_requirements
banner

echo -e "\nSelect tools to install (type numbers like 1 2 3)"
echo -e "For All: \e[1;32m100\e[0m"
i=1
for item in "${TOOLS[@]}"; do
  color=${colors[$((i % ${#colors[@]}))]}
  name=$(echo "$item" | cut -d":" -f1)
  echo -e "${color}$i) $name${color_reset}"
  ((i++))
done

echo -ne "\nYour choices: "
read -a choices

# If user typed 100, install all tools
if [[ "${choices[@]}" =~ "100" ]]; then
  choices=()
  for idx in "${!TOOLS[@]}"; do choices+=("$((idx+1))"); done
fi

# Install selected tools
for choice in "${choices[@]}"; do
  index=$((choice - 1))
  tool="${TOOLS[$index]}"
  name=$(echo "$tool" | cut -d":" -f1)
  cmd=$(echo "$tool" | cut -d":" -f2-)

  echo -e "\n🔧 Installing $name..."
  eval "$cmd"
  echo "✅ $name installation completed."
done

echo -e "\n🎉 All selected tools installed successfully."
echo "👉 You can now run tools globally like: nmap, ffuf, httpx, nuclei, etc."
echo "💡 For GitHub tools like sqlmap: cd /opt/bughunter-tools/sqlmap && python3 sqlmap.py"
