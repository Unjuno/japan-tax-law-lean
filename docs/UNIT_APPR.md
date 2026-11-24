# Normative units — 充当（…に充当する）（39 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…当する。」(充当する)
are appropriations: a refund/overpayment is applied to an unpaid tax liability.

| id | content |
|---|---|
| H | 充当で負債は充当額だけ減る; 全額充当で負債は 0; 充当額は負債以下; 連鎖充当では第1負債への全額充当で残余は 0; 複数充当は加算的。 |
| T | `lake build JapanTaxLaw.AppropriationNormsTests`; `python scripts/ci/source_audit_appr.py` |
| D | カーネル証明: full_appropriation_zeroes / appropriation_bounded / full_first_leaves_second / total_is_sum。39片 verbatim (3/3)。 |
| C | 対立解釈: 全額充当で負債が残る読み、充当額が負債を超える読み、連鎖充当で残余が残る読みを却下。 |
| U | 具体の税目・金額・充当順序は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
