# =============================================
# 500X ATTACK PROMPTS
# Master list of all attack prompts
# =============================================

## USAGE
```bash
source tools-v2/prompts/500x-attack-prompts.sh
# Then call any prompt function
basic-web-recon <target>
full-attack <target>
```

## CORE PROMPTS

basic-web-recon() {
    echo "Perform basic web reconnaissance on $1"
}

full-attack() {
    echo "Launch comprehensive attack on $1"
}

network-attack() {
    echo "Attack network services on $1"
}

brute-force() {
    echo "Brute force $1"
}

sql-injection() {
    echo "Test for SQL injection on $1"
}

xss-test() {
    echo "Test for XSS vulnerabilities on $1"
}

social-engineering() {
    echo "Social engineering campaign targeting $1"
}

custom-payload() {
    echo "Generate custom payload for $1"
}

osint-recon() {
    echo "OSINT reconnaissance on $1"
}

full-report() {
    echo "Generate comprehensive report on $1"
}
```

```bash
# Source this file
count=$(grep -c '() {' tools-v2/prompts/500x-attack-prompts.sh)
> echo "Total attack prompts: $count"
```