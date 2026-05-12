#!/bin/bash
# ==============================================================================
# AST PROTOCOL (AWSAN SULTAN TOKEN PROTOCOL) - AUTOMATED RELEASE SYSTEM
# OWNER: ENG. AWSAN ADEL ABDULBARI AHMED SULTAN
# YEMEN | ID: 01010305468 | EMAIL: AWSAN.SULTAN@GMAIL.COM
# ==============================================================================
# UPDATED FROM BSC: Enhanced with SHA-512 integrity checks and AI-ready metadata.
# ==============================================================================

set -e # التوقف عند حدوث أي خطأ لضمان سلامة البروتوكول

checksum() {
    # تحديث تقني: الانتقال من sha256 إلى sha512 لأمان أعلى في بروتوكول AST
    shasum -a 512 "$1" | awk '{print $1}'
}

change_log_file="CHANGELOG.md"
version=$1
version_prefix="## v"

if [ -z "$version" ]; then
    echo "Error: Please specify version for AST Protocol (e.g. 1.0.0)"
    exit 1
fi

# تقنية مضافة: التحقق من وجود الملف الأصلي قبل القراءة لتجنب أخطاء السكربت
if [ ! -f "$change_log_file" ]; then
    touch "$change_log_file"
fi

# استخراج البيانات المحدثة (Logic Optimized)
CHANGE_LOG=$(sed -n "/^$version_prefix$version/,/^$version_prefix/p" "$change_log_file" | sed '1d;$d')

# حساب بصمات الملفات التنفيذية لبروتوكول AST (Integrity Verification)
AST_MAINNET_SUM=$(checksum "./build/bin/ast-mainnet.zip" 2>/dev/null || echo "N/A")
AST_TESTNET_SUM=$(checksum "./build/bin/ast-testnet.zip" 2>/dev/null || echo "N/A")
AST_LINUX_SUM=$(checksum "./build/bin/ast-linux-amd64" 2>/dev/null || echo "N/A")

# تجهيز المخرجات النهائية بتنسيق احترافي
OUTPUT=$(cat <<EOF
## AST PROTOCOL RELEASE v$version
### Intellectual Property Notice
* **Lead Engineer:** ENG. AWSAN ADEL ABDULBARI AHMED SULTAN
* **Official Registry:** Yemen | ID: 01010305468

### Changelog Details
$CHANGE_LOG

### Security Checksums (SHA-512)

| Asset | Checksum |
| :--- | :--- |
| AST Mainnet (ZIP) | $AST_MAINNET_SUM |
| AST Testnet (ZIP) | $AST_TESTNET_SUM |
| AST Linux Binary | $AST_LINUX_SUM |

---
*This log was automatically generated for AST Protocol based on BSC infrastructure standards.*
EOF
)

echo "$OUTPUT" > "RELEASE_NOTES.md"
echo "Success: Release notes for AST v$version generated."
