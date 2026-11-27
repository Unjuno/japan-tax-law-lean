import importlib.util, json
from pathlib import Path
R = Path(r'D:\CodexData\Temp\pr764-clean')
spec = importlib.util.spec_from_file_location(
    've764', R / 'scripts/ci/generate_verification_evidence.py')
ve = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ve)
m = ve.checks_by_module()
for key in ('SeparateTariffApplication', 'CustomsTariffArt7InvestigationStartDeadline'):
    print(key, json.dumps(m.get(key), ensure_ascii=False))
