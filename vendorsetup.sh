export AOSP_REVISION=$(grep "default revision" ".repo/manifests/default.xml" | awk -F '/' '{print $3}' | awk -F '"' '{print $1}')

# Welcome Msg
echo "=========================================="
echo "      ___                  ____  ____ ";
echo "     / _ \__ ________ ___ / __ \/ __/    ";
echo "    / , _/ // /_ / -_/ _ / /_/ _\ \     ";
echo "   /_/|_|\_, //__\__/_//_\____/___/    ";
echo "        /___/                         ";
echo "                                        ";
echo "       RyzenOS Build Environment "
echo "=========================================="
echo "AOSP Revision: $AOSP_REVISION"
