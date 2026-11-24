# Normative units — 書類要件（する書類/した書類/書の提出）（520 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Three documentary-requirement suffixes:
「…する書類」(352, document evidencing a matter), 「…した書類」(102, document
recording a matter), 「…書の提出」(66, submission of a specified return/notice).

| id | content |
|---|---|
| H | 書類要件は書類が存在し記載が完全なとき充足; 存在しない/記載不完全なら不充足; 提出義務は提出済みなら充足; 複数要件はすべて必要(連言); 要件AがBを含むならA充足はB充足を導く。 |
| T | `lake build JapanTaxLaw.DocumentRequirementNormsTests`; `python scripts/ci/source_audit_doc.py` |
| D | カーネル証明: requirement_needs_both / requirement_fails_absent / requirement_fails_incomplete / all_one_missing / implies_carries。520片 verbatim (3/3)。 |
| C | 対立解釈: 存在しない書類で要件が充足する読み、記載不完全でも充足する読み、連言を選言とみなす読みを却下。 |
| U | 具体の書類・記載事項・提出手続は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
