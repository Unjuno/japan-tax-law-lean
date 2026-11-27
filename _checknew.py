import subprocess
R = r'D:\CodexData\Temp\pr764-clean'
revs = ['origin/main', 'origin/formalize/separate-tariff-application',
        'origin/formalize/cabinet-order-matters-delegation']
needle = '前項の調査は、当該調査を開始した日から一年以内に終了するものとする。'
for rev in revs:
    r = subprocess.run(['git','-C',R,'ls-tree','-r','--name-only',rev],
                       capture_output=True, text=True, encoding='utf-8', errors='replace')
    names = [x for x in r.stdout.splitlines() if 'Investigation' in x or 'OneYear' in x]
    print(rev, 'MODULES', names)
    r2 = subprocess.run(['git','-C',R,'grep','-l',needle,rev,'--',
                         'scripts/ci/transcription_audit.py','JapanTaxLaw'],
                        capture_output=True, text=True, encoding='utf-8', errors='replace')
    print(rev, 'NEEDLE_HITS', r2.stdout.strip().splitlines())
