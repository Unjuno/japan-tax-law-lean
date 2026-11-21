# Unit review — 国税通則法施行規則 第一条の三(5)（財務省令で定める金額 1億円）

Normative unit id: `NORM|81fcecfaad1e405b864c4c594c99d6f9861e6155e9f59de04aa96a9ffd9b62f9`

Law: 337M50000040028 (国税通則法施行規則), law number 昭和三十七年大蔵省令第二十八号,
law_type **MinisterialOrdinance (省令)**, revision `337M50000040028_20261101_507M60000040025` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/337M50000040028_20261101_507M60000040025.law.json`,
sha256 `0e9e6d76754a9ecc71f701f7bfd4207730907d11d0e3f439adfc25be66bf07df`.

Verbatim source text: 「法第三十四条第二項に規定する財務省令で定める金額は、一億円とする。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[2]/Article:1_3/Article#1_3/Paragraph#5/ParagraphSentence/Sentence#1` — MainProvision Article 第一条の三, caption （納付に係る届出等）. `find_article_text(...,"第一条の三")` returns that article (len 1332) containing the needle → article-kind locator used.

Norm kind: **DELEGATION** — the ordinance fixes the amount delegated by 法第三十四条第二項 at ¥100,000,000 (一億円), derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric constant) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The delegated amount is ¥100,000,000 (一億円). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「delegated amount 100M yen…↔ NationalTaxCommonDelegatedAmount.lean」. Full audit: 233/233 checks passed. |
| D (decision) | PASS — audit reports `233/233 checks passed`. |
| C (competing interpretation) | Only the delegated amount is modeled. The underlying Act provision (法第三十四条第二項), rest of article 1-3, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/NationalTaxCommonDelegatedAmount.lean` — `delegatedAmountYen=100_000_000` (programmatically derived); `amount_decoded` rfl.
- Independent spec: `specAmountPredecessor=99_999_999` with `agree_amount_successor` (succ predecessor = amount), boundary decomposition distinct from rfl; axiom-free.
- Build: `lake build` → full build success (749 jobs); 2 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Underlying Act provision 法第三十四条第二項, rest of article 1-3, other paragraphs and articles. Computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_NATIONAL_TAX_COMMON_DELEGATED_AMOUNT.md`.
