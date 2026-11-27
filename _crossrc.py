import subprocess
r = subprocess.run(['python', 'scripts/law_audit/phase_e/cross_law.py'],
                   cwd=r'D:\CodexData\Temp\pr764-clean',
                   capture_output=True, text=True, encoding='utf-8', errors='replace')
print('RC', r.returncode)
for l in (r.stdout + r.stderr).splitlines()[:5]:
    print(l.encode('ascii', 'backslashreplace').decode())
