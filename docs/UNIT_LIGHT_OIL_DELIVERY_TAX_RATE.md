# Unit review — 地方税法 第百四十四条の十（軽油引取税の税率: ¥15,000/キロリットル）

Normative unit id: `NORM|1f1e4ed103a791c1b9d4b42f6e04fe784e392a84286e09d3396eba710c8773e2`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「軽油引取税の税率は、一キロリットルにつき、一万五千円とする。」 (一万五千円 = ¥15,000 per kilolitre).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:144_10/Article#144_10/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第百四十四条の十, caption （軽油引取税の税率）. `find_article_text(...,"第百四十四条の十")` returns that article (len 48) containing the needle → article-kind locator used.

Norm kind: **EFFECT** — a tax rate with physical unit: ¥15,000 per kilolitre (一キロリットルにつき), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric rate) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The 軽油引取税 rate is ¥15,000 per kilolitre. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「light oil delivery tax rate 15000 yen per kilolitre…↔ LightOilDeliveryTaxRate.lean」. Full audit: 246/246 checks passed. |
| D (decision) | PASS — audit reports `246/246 checks passed`. |
| C (competing interpretation) | Only the rate and its linear extension over whole kilolitres are modeled. Fractional kilolitres, exemptions, tax base, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LightOilDeliveryTaxRate.lean` — `rateYenPerKilolitre=15_000` (programmatically derived); `taxYen kl := rate * kl`.
- Independent spec: `specTaxYen kl := Nat.rec 0 (fun _ acc => acc + 15000) kl` (repeated addition, distinct); `agree_tax` & `mul_eq_accumulate` universal & axiom-free.
- Boundary checks: 1 kl = 15,000; 3 kl = 45,000.
- Build: `lake build` → full build success (788 jobs); 2 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Fractional kilolitres, exemptions, tax base, other paragraphs and articles. Computable slice of one EFFECT norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LIGHT_OIL_DELIVERY_TAX_RATE.md`.
