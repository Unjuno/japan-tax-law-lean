import subprocess
R = r'D:\CodexData\Temp\pr764-clean'
def exists(rev, path):
    r = subprocess.run(['git','-C',R,'cat-file','-e',f'{rev}:{path}'],
                       capture_output=True)
    return r.returncode == 0
pairs = [
    ('origin/formalize/cabinet-order-matters-delegation', 'JapanTaxLaw/SeparateTariffApplication.lean'),
    ('origin/formalize/separate-tariff-application', 'JapanTaxLaw/CabinetOrderMattersDelegation.lean'),
    ('origin/main', 'JapanTaxLaw/SeparateTariffApplication.lean'),
    ('origin/main', 'JapanTaxLaw/CabinetOrderMattersDelegation.lean'),
]
for rev, path in pairs:
    print(rev, path, 'EXISTS' if exists(rev, path) else 'ABSENT')
