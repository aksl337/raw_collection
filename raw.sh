#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

echo "${GREEN} [+] Updating and installing dependencies ${RESET}"
echo ""
{
sudo apt-get -y update
sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | sudo debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | sudo debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | sudo debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y jq
sudo apt-fast install -y ruby-full
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git gcc make libcap-dev
sudo apt-fast install -y npm
sudo apt-fast install -y nmap phantomjs
sudo apt-fast install -y gem
sudo apt-fast install -y perl
sudo apt-fast install -y parallel
sudo apt-fast install -y tmux file
sudo apt-fast install -y dnsutils
pip3 install jsbeautifier
echo ""
} > /dev/null 2>&1


echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
curl --silent  https://raw.githubusercontent.com/aksl337/raw_collection/master/bash_aliases.txt > ~/.bash_aliases
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ] && [ ! -f /$HOME/.go/bin/go ];then
    cd ~
    {
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
	# default PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile
    } > /dev/null
else
    echo "${BLUE} Golang is already installed${RESET}"
fi
echo "${BLUE} Done installing Golang ${RESET}"
echo ""


echo "${GREEN} [+] Installing Subdomain Enum tools ${RESET}"
{
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
git clone https://github.com/Healdb/Elevate.git ~/tools/Elevate
go get -u github.com/harleo/knockknock
go get -u github.com/tomnomnom/assetfinder
sudo pip3 install spyse.py

subscraper(){
git clone https://github.com/m8r0wn/subscraper ~/tools/subscraper
cd ~/tools/subscraper
sudo python3 setup.py install
}
subscraper

subdomainizer(){
git clone https://github.com/nsonaniya2010/SubDomainizer.git ~/tools/SubDomainizer
cd ~/tools/SubDomainizer && chmod +x SubDomainizer.py
sudo pip3 install -r requirements.txt
}
subdomainizer

crtsh(){
git clone https://github.com/YashGoti/crtsh.py ~/tools/crtsh.py
cd ~/tools/crtsh.py && sudo pip3 install -r requirements.txt
}
crtsh

sublert(){
git clone https://github.com/yassineaboukir/sublert.git ~/tools/sublert
sudo pip3 install virtualenv setuptools
virtualenv sublert
source sublert/bin/activate
cd ~/tools/sublert
sudo pip3 install -r requirements.txt
}
sublert

subsh(){
git clone https://github.com/cihanmehmet/sub.sh.git ~/tools/subsh
cd ~/tools/subsh && chmod +x sub.sh
}
subsh

OneforAll(){
git clone https://github.com/shmilylty/OneForAll.git ~/tools/OneForAll
cd ~/tools/OneForAll
sudo python3 -m pip install -U pip3 setuptools wheel -i https://mirrors.aliyun.com/pypi/simple/
sudo pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
}
OneForAll

shosubgo(){
git clone https://github.com/incogbyte/shosubgo.git ~/tools/shosubgo
cd ~/tools/shosubgo/
go build main.go && mv main shosubgo && sudo mv shosubgo /usr/bin/
}
shosubgo

sublister(){
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r
cd ~/tools/Sublist3r
sudo pip3 install -r requirements.txt
}
sublister

findomain(){
cd ~/tools
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
sudo chmod +x findomain-linux
sudo mv findomain-linux /usr/bin/findomain
}
findomain

amass(){
GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...
}
amass

} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Installing Resolvers ${RESET}"
{
pip3 install dnsgen;
pip3 install py-altdns;
pip3 install aiodnsbrute;
go get -u github.com/projectdiscovery/shuffledns/cmd/shuffledns
go get -u github.com/tomnomnom/httprobe
go get -u github.com/projectdiscovery/dnsprobe
go get -u github.com/tomnomnom/burl
curl --silent https://raw.githubusercontent.com/rastating/dnmasscan/master/dnmasscan > dnmasscan && sudo mv dnmasscan /usr/bin/ && chmod +x /usr/bin/dnmasscan
go get -u github.com/projectdiscovery/httpx/cmd/httpx


massdns(){
git clone https://github.com/blechschmidt/massdns.git ~/tools/massdns
cd ~/tools/massdns
make
}
massdns

knockpy(){
git clone https://github.com/guelfoweb/knock.git ~/tools/knockpy
cd ~/tools/knockpy
sudo python setup.py install
}
knockpy
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""


echo "${GREEN} [+] Installing Subdomain Takeover tools ${RESET}"
{
go get -u github.com/Ice3man543/SubOver
pip3 install autosubtakeover
git clone https://github.com/antichown/subdomain-takeover.git ~/tools/STO
go get -u github.com/anshumanbh/tko-subs
go get -u github.com/haccer/subjack
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""



echo "${GREEN} [+] Installing Cloud workflow Tools ${RESET}"
{
gem install aws_recon
sudo pip3 install awscli --upgrade --user
git clone https://github.com/gwen001/s3-buckets-finder.git ~/tools/s3-buckets-finder
git clone https://github.com/nahamsec/lazys3.git ~/tools/lazys3
git clone https://github.com/ghostlulzhacks/s3brute.git ~/tools/s3brute
git clone https://github.com/greycatz/CloudUnflare.git ~/tools/CloudUnflare
git clone https://github.com/fellchase/flumberboozle ~/tools/flumberboozle
git clone https://github.com/appsecco/spaces-finder.git ~/tools/spaces-finder
pip3 install festin

slurp(){
git clone https://github.com/avineshwar/slurp.git ~/tools/slurp
cd ~/tools/slurp
go build main.go && mv main slurp
}
slurp

cloud_enum(){
git clone https://github.com/initstring/cloud_enum.git ~/tools/cloud_enum
cd ~/tools/cloud_enum && pip3 install -r requirements.txt
}
cloud_enum

S3Scanner(){
git clone https://github.com/sa7mon/S3Scanner.git ~/tools/S3Scanner
cd ~/tools/S3Scanner
sudo pip3 install -r requirements.txt
}
S3Scanner

cloudflair(){
git clone https://github.com/christophetd/CloudFlair.git ~/tools/CloudFlair
cd ~/tools/CloudFlair && chmod +x cloudflair.py
sudo pip3 install -r requirements.txt
}
cloudflair


GCPBucketBrute(){
git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute.git ~/tools/GCPBucketBrute
cd ~/tools/GCPBucketBrute
sudo python3 -m pip install -r requirements.txt
}
GCPBucketBrute
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""


echo "${GREEN} [+] Installing Fuzzing tools ${RESET}"
{
go get -u github.com/OJ/gobuster
go get -u github.com/ffuf/ffuf
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch
sudo apt-fast install wfuzz
go get -u github.com/tomnomnom/meg
go get -u github.com/tomnomnom/waybackurls
sudo pip3 install dirhunt
sudo apt-fast install -y dirb
go get -u github.com/lc/gau

secretfinder(){
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder
cd ~/tools/SecretFinder && chmod +x secretfinder
sudo pip3 install -r requirements.txt
}
secretfinder
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Visual Inspection tools ${RESET}"
{
go get -u github.com/michenriksen/aquatone
go get -u github.com/sensepost/gowitness
go get -u github.com/tomnomnom/concurl
git clone https://github.com/FortyNorthSecurity/EyeWitness.git ~/tools/EyeWitness
bash ~/tools/EyeWitness/Python/setup/setup.sh
git clone https://github.com/breenmachine/httpscreenshot.git ~/tools/httpscreenshot
} > /dev/null
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Content Discovery tools ${RESET}"
{
go get -u github.com/jaeles-project/gospider
pip3 install scrapy
go get -u github.com/m4ll0k/Aron
git clone https://github.com/s0md3v/Arjun.git ~/tools/Arjun


photon(){
git clone https://github.com/s0md3v/Photon.git ~/tools/Photon
cd ~/tools/Photon
sudo pip3 install -r requirements.txt
}

paramspider(){
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider
sudo pip3 install -r requirements.txt
}
paramspider

hakrawler(){
git clone https://github.com/hakluke/hakrawler.git ~/tools/hakrawler
cd ~/tools/hakrawler
go build main.go && mv main hakrawler
sudo mv hakrawler /usr/bin/
}
hakrawler
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Installing CMS Tools ${RESET}"
{
git clone https://github.com/rezasp/joomscan.git ~/tools/CMS/Joomscan
sudo gem install wpscan
git clone https://github.com/0ang3el/aem-hacker.git ~/tools/CMS/aem-hacker
sudo pip3 install droopescan

CMSmap(){
git clone https://github.com/Dionach/CMSmap.git ~/tools/CMS/CMSmap
cd ~/tools/CMS/CMSmap
sudo pip3 install .
}
CMSmap

wig(){
git clone https://github.com/jekyc/wig.git ~/tools/CMS/wig
cd ~/tools/wig
sudo python3 setup.py install
}
wig

CMSeeK(){
git clone https://github.com/Tuhinshubhra/CMSeeK.git ~/tools/CMS/CMSeeK
cd ~/tools/CMS/CMSeek
sudo python3 -m pip install -r requirements.txt
}
CMSeeK


drupwn(){
git clone https://github.com/immunIT/drupwn.git ~/tools/CMS/drupwn
cd ~/tools/CMS/drupwn
sudo python3 setup.py install
}
drupwn
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""


echo "${GREEN} [+] Downloading Git tools ${RESET}"
{
go get -u github.com/eth0izzle/shhgit
pip3 install truffleHog

gitscanner(){
git clone https://github.com/HightechSec/git-scanner ~/tools/GIT/git-scanner
cd ~/tools/GIT/git-scanner && chmod +x gitscanner.sh
}
gitscanner

gitgraber(){
git clone https://github.com/hisxo/gitGraber.git ~/tools/GIT/gitGraber
cd ~/tools/GIT/gitGraber && chmod +x gitGraber.py
sudo pip3 install -r requirements.txt
}
gitgraber

githound(){
git clone https://github.com/tillson/git-hound.git ~/tools/GIT/git-hound
cd ~/tools/GIT/git-hound
sudo go build main.go && mv main githound
}
githound

gitsearch(){
git clone https://github.com/gwen001/github-search.git ~/tools/GIT/github-search
cd ~/tools/GIT/github-search
sudo pip3 install -r  requirements3.txt
}
gitsearch
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""


echo "${GREEN} [+] Downloading Frameworks ${RESET}"
{
git clone https://github.com/1N3/Sn1per.git ~/tools/Frameworks/Sn1per
osmedeus(){
echo "setup osmedeus"
git clone https://github.com/j3ssie/Osmedeus.git ~/tools/Frameworks/osmedeus
cd ~/tools/Frameworks/osmedeus
./install.sh
}
osmedeus
git clone https://github.com/WhaleShark-Team/cobra.git ~/tools/Frameworks/Cobra
git clone https://github.com/0xinfection/tidos-framework.git ~/tools/Frameworks/TIDoS-Framework
git clone https://github.com/m4ll0k/WAScan.git ~/tools/Frameworks/WAScan
git clone https://github.com/1N3/BlackWidow.git ~/tools/Frameworks/BlackWidow
git clone --recursive https://github.com/screetsec/Sudomy.git ~/tools/Frameworks/Sudomy
git clone https://github.com/dwisiswant0/scant3r.git ~/tools/Frameworks/scant3r
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""


echo "${GREEN} [+] JS Enum Tools ${RESET}"
{
go get github.com/003random/getJS
go get -u github.com/lc/subjs
git clone https://github.com/dark-warlord14/JSScanner.git ~/tools/JSScanner
git clone https://github.com/zseano/JS-Scan.git ~/tools/JS-Scan
git clone https://github.com/robre/scripthunter.git ~/tools/jshunter

JSParser(){
git clone https://github.com/nahamsec/JSParser.git ~/tools/JSParser
cd ~/tools/JSParser
sudo python3 setup.py install
}

LinkFinder(){
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder
cd ~/tools/LinkFinder
sudo pip3 install -r requirements.txt
sudo python3 setup.py install
}
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Fingerprinting & CVE tools ${RESET}"
{
sudo pip3 install webtech
go get -u github.com/projectdiscovery/chaos-client/cmd/chaos
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
nuclei -update-templates;
git clone https://github.com/projectdiscovery/nuclei-templates ~/tools/nuclei-templates

gfp(){
cd ~/tools
go get -u github.com/tomnomnom/gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf;
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/tools/Gf-Patterns/*.json /root/.gf
rm -rf ~/tools/Gf-Patterns
wget https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json;
mv ~/tools/potential.json /root/.gf;
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc;
}
gfp

waf(){
git clone https://github.com/EnableSecurity/wafw00f.git ~/tools/waff00f
cd ~/tools/wafw00f
sudo python3 setup.py install
}
waf
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Network and Port Scanning tools ${RESET}"
{
sudo apt-fast install -y nmap
sudo apt-fast install -y brutespray
sudo apt-fast install -y nikto
sudo apt-fast install -y masscan
go get -u github.com/j3ssie/metabigor
go get -u github.com/projectdiscovery/naabu/cmd/naabu


asnlookup(){
git clone https://github.com/yassineaboukir/asnlookup.git ~/tools/asnlookup
cd ~/tools/asnlookup
sudo pip3 install -r requirements.txt
}
} > /dev/null 2>&1
echo "${BLUE} Done ${RESET}"
echo ""

echo "${GREEN} [+] Downloading wordlists ${RESET}"
{
mkdir ~/tools/wordlists;
cd ~/tools/wordlists/
git clone https://github.com/assetnote/commonspeak2-wordlists
wget https://raw.githubusercontent.com/Mad-robot/recon-tools/master/dicc.txt
git clone https://github.com/1N3/IntruderPayloads
git clone https://github.com/swisskyrepo/PayloadsAllTheThings
git clone https://github.com/danielmiessler/SecLists
cd SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/dirsearch/db/
wget https://github.com/xyele/hackerone_wordlist/releases/download/beta/wordlists.zip
unzip wordlists.zip
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt
wget https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/wordswithext/php.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-files.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/spring-boot.txt
wget https://raw.githubusercontent.com/milo2012/pathbrute/master/defaultPaths.txt
wget https://raw.githubusercontent.com/milo2012/pathbrute/master/cvePaths.txt
} > /dev/null 2>&1
printf "${BLUE} Done ${RESET}"
echo ""
echo ""


echo "${GREEN} [+] Installing tomnomnom tools ${RESET}"
echo "${GREEN} check out his other tools as well  ${RESET}"
{
go get -u github.com/tomnomnom/hacks/concurl
go get -u github.com/tomnomnom/unfurl
go get -u github.com/tomnomnom/hacks/anti-burl
go get -u github.com/tomnomnom/hacks/filter-resolved
go get -u github.com/tomnomnom/fff
go get -u github.com/tomnomnom/qsreplace
go get -u github.com/tomnomnom/hacks/tok

} > /dev/null 2>&1

echo "${GREEN} #### Installing CORS Tools #### ${RESET}"

echo "${BLUE} installing corsy ${RESET}"
git clone https://github.com/s0md3v/Corsy.git ~/tools/corsy
cd ~/tools/corsy
pip3 install -r requirements.txt
chmod +x corsy.py
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing cors-scanner ${RESET}"
git clone https://github.com/chenjj/CORScanner.git ~/tools/corscanner
cd ~/tools/corscanner
pip3 install -r requirements.txt
echo "${BLUE} done ${RESET}"
echo ""

echo "${BLUE} installing another cors scanner${RESET}"
go get -u github.com/Tanmay-N/CORS-Scanner
echo "${BLUE} done${RESET}"
echo ""


echo "Getting smuggler.py"
git clone https://github.com/defparam/smuggler.git ~/tools/smuggler
echo "recon dir"
git clone https://github.com/venom26/recon.git ~/tools/recon
cp ~/tools/recon/ffuf_extension.txt ~/tools/

echo "whatweb"
git clone https://github.com/urbanadventurer/WhatWeb.git ~/tools/WhatWeb

####favfreak
echo "FavFreak"
git clone https://github.com/devanshbatham/FavFreak ~/tools/FavFreak
cd ~/tools/FavFreak
virtualenv -p python3 env
source /root/tools/FavFreak/env/bin/activate
pip3 install -r requirements.txt 
deactivate

#relative-url
echo "relative-url-extractor"
git clone https://github.com/jobertabma/relative-url-extractor ~/tools/relative-url-extractor


echo "${BLUE} LinkFinder${RESET}"
git clone https://github.com/GerbenJavado/LinkFinder.git ~/tools/LinkFinder
cd ~/tools/LinkFinder
pip3 install -r requirements.txt
python3 setup.py install
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} SecretFinder${RESET}"
git clone https://github.com/m4ll0k/SecretFinder.git ~/tools/SecretFinder
cd ~/tools/SecretFinder && chmod +x secretfinder
pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

#rustscan other way install
echo "${BLUE} RustScan${RESET}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y;
source /root/.cargo/env
git clone https://github.com/RustScan/RustScan ~/tools/RustScan
cd ~/tools/RustScan
cargo build --release;
wait $!
ulimit -n 8800
ln -s /root/tools/RustScan/target/release/rustscan /usr/bin/rustscan
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} Tmux config ${RESET}"
tmux_config(){
echo "working tmux config"
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
}
tmux_config
echo "${BLUE} done${RESET}"
echo ""



echo "${RED} use the command 'source ~/.bash_profile,bashrc,bash_aliases' for the shell functions to work ${RESET}"
echo ""
echo "${RED}      ALL THE THANKS TO THE BEST PEOPLE OF THE INFOSEC COMMUNITY   ${RESET}"
