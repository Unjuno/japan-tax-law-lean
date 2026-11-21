# Unit review — 地方税法 第八百三条（過料 十万円以下 = ¥100,000, administrative fine）

Normative unit id: `NORM|7b8ad3cf00fe6bc2ee7c9a071318722612356de6b823cf0fbaecdb1cab531ea3`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「第七百六十七条第二項の規定に違反した者は、十万円以下の過料に処する。」 (十万円 = ¥100,000; 過料 = administrative fine, NOT criminal 罰金).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[8]/Article:803/Article#803/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第八百三条, caption (no caption). `find_article_text(...,"第八百三条")` returns that article (len 39) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — an administrative fine (過料) ceiling ≤ ¥100,000 (十万円以下, inclusive), derived programmatically from the verbatim kanji numeral, for violation of 第七百六十七条第二項.

Byte fidelity: all statutory Japanese strings (title, law number, verbatim quote, numeric ceiling) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The administrative fine ceiling is ¥100,000 (十万円以下, inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「administrative fine 100k yen…↔ LocalTaxArt803AdministrativeFine.lean」. Full audit: 250/250 checks passed. |
| D (decision) | PASS — audit reports `250/250 checks passed`. |
| C (competing interpretation) | Only the administrative fine ceiling is modeled. The violation condition (第七百六十七条第二項), sentencing, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxArt803AdministrativeFine.lean` — `maxAdministrativeFineYen=100_000` (programmatically derived); `withinFineLimit fine := fine ≤ maxAdministrativeFineYen`.
- Independent spec: successor-strict `fine < Nat.succ maxAdministrativeFineYen`; `agree_fine_limit` universal & axiom-free.
- Boundary checks: ¥100,000 qualifies; ¥100,001 fails.
- Build: `lake build` → full build success (800 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Violation condition (第七百六十七条第二項), sentencing, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART803_ADMINISTRATIVE_FINE.md`.
