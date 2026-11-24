# Normative units — 書類の写し（…の写し）（137 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…の写し。」require
a copy of a specified document (契約書の写し, 認定書の写し, 手帳の写し).

| id | content |
|---|---|
| H | 写し要件は写しが提出済みかつ原本に対応するとき充足; 写しなし/原本不一致では不充足; 写しは原本識別子で区別される; 複数写し要件は連言(すべて必要)。 |
| T | `lake build JapanTaxLaw.DocumentCopyNormsTests`; `python scripts/ci/source_audit_docopy.py` |
| D | カーネル証明: copy_satisfied / copy_fails_absent / copy_fails_mismatch / copy_needs_both / all_one_missing。137片 verbatim (3/3)。 |
| C | 対立解釈: 写しなしで要件が充足する読み、原本と異なる写しで充足する読み、複数写しを選言とみなす読みを却下。 |
| U | 具体の文書・原本は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
