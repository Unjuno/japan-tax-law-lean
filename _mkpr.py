import json
from pathlib import Path
body = """## What

Formally verifies one computable DELEGATION norm unit: 地方税法施行令 第八条の三 「法第四十七条第一項第一号に規定する政令で定める金額は、三千円とする。」 — the CabinetOrder fixes the delegated amount at ¥3,000.

- Normative unit: NORM|92588e30e308fe82f1159ad13f75bfdaa96ba59a454b7739c70ead26f70ef7c7 (kind=DELEGATION)
- Law 325CO0000000245 (地方税法施行令, 昭和二十五年政令第二百四十五号, CabinetOrder 政令), revision 325CO0000000245_20261101_508CO0000000083
- Needle verbatim-unique in MainProvision Article 第八条の三 (caption 個人の道府県民税の徴収取扱費の算定の基礎となる金額, len 66 locator confirmed).
- ¥3,000 derived programmatically from the verbatim kanji numeral 三千円; all statutory Japanese strings injected from authoritative sources.

## Added

- JapanTaxLaw/LocalTaxEnforcementDelegatedAmount3000.lean (+ Spec, Tests) — implementation, independent predecessor-boundary spec, axiom-free proofs.
- scripts/ci/transcription_audit.py — pinned verbatim needle article-kind check (252/252 PASS).
- docs/UNIT_LOCAL_TAX_ENFORCEMENT_DELEGATED_AMOUNT_3000.md, docs/ADVERSARIAL_LOCAL_TAX_ENFORCEMENT_DELEGATED_AMOUNT_3000.md.
- Evidence ledger entry (11 axes).

## Verification

- lake build: full build success (806 jobs); unit build 5 jobs.
- transcription audit: 252/252 PASS. no-sorry clean; 2 theorems axiom-free.
- queue invariants: 14/14 PASS; FV=213, NOT_STARTED=396637; decomposition coverage 33652/33652 exact; evidence refs 1017/1021 (4 pre-existing unresolved).
- independent adversarial review: 1 concrete finding F1 (hand-typed prose provision 法第四十三条 vs authoritative 法第四十七条) reproduced and fixed (43→47 everywhere, 0 remaining); confirmation F1_RESOLVED, NEW_FINDINGS none; gates re-run green.

## Scope

Computable slice of one DELEGATION norm unit — the delegated amount only. Underlying Act provision, rest of article 8-3, other paragraphs and articles NOT MODELLED. No law-level completion claim. Human legal review remains pending."""
payload = {"title": "Verify delegated amount 3000 yen (DELEGATION)", "head": "verify/turn55", "base": "main", "body": body}
Path("_pr.json").write_text(json.dumps(payload, ensure_ascii=False), encoding="utf-8")
print("wrote _pr.json")
