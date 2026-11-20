# Unit review — 関税定率法施行令 第一条の二(1)第三号（十万円超）

Normative unit id: `NORM|347d0d0ebd32cab1a2f5054abe7a87ebe56cae34b125a2481f38c63e5cf05723`

Law: 329CO0000000155 (関税定率法施行令, Customs Tariff Act Enforcement Order),
law number 昭和二十九年政令第百五十五号, law_type CabinetOrder (政令),
revision `329CO0000000155_20260401_508CO0000000085` (derived from INVENTORY
`current_revision.law_revision_id`, matched against raw `revision_info.law_revision_id`
— NOT guessed), snapshot `data/raw/329CO0000000155_20260401_508CO0000000085.law.json`,
sha256 `7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01`.

Verbatim source text: 「前二号に掲げるもののほか、一個又は一組の課税価格が十万円を超えるもの」
(note: 一個 uses Japanese kanji 個 U+500B, not simplified 个 U+4E2A).

Exact source position:
`LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/Paragraph#1/Item#3/ItemSentence/Sentence#1`.
The needle is in a nested e-Gov Article wrapper (Article:1_2 / Article#1_2);
`find_article_text` stops at the first MainProvision Article and surfaces a
different 第一条の二 (length 770, needle absent), so the audit uses a file-kind
locator. The needle is verbatim-unique in the whole law.
Norm kind: **CONDITION** (dutiable value 課税価格 strictly exceeds ¥100,000: 十万円を超える).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This clause defines a dutiable-value threshold: 課税価格 > ¥100,000 (十万円を超える, strict). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「関税定率法施行令 art.1の2(1)第三号…↔ CustomsDutiableValueThreshold.lean」 pinned to law 329CO0000000155, verbatim needle (verbatim-unique in whole law). Full audit: 192/192 checks passed. |
| D (decision) | PASS — audit reports `192/192 checks passed`. |
| C (competing interpretation) | The needle is Item 3 of 第一条の二(1), gated by 「前二号に掲げるもののほか」. This slice models the threshold predicate only; items 1-2, the substantive rule this item gates, other paragraphs, 省令 details and customs valuation rules are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Transcription-fidelity defect found and fixed during development

The author's first audit needle literal contained `个` (U+4E2A, simplified Chinese)
instead of the queue-authoritative `個` (U+500B, Japanese kanji), so the check
failed (needle count 0). A byte-level diagnostic (`json.dumps(..., ensure_ascii=True)`
comparison against the queue text) identified the single-character mismatch at
position 14; it was corrected and the audit now passes 192/192. This validates
the gate's purpose — transcription fidelity is checked independently of the Lean proof.

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsDutiableValueThreshold.lean` — `thresholdYen=100_000`, `aboveThreshold v := thresholdYen < v`.
- Independent spec: `specAboveThreshold v := Nat.succ thresholdYen ≤ v` (successor-based strict lower bound, distinct formulation); `agree_threshold` universal over all dutiable values.
- Boundary theorems: `threshold_exclusive` (100,000 fails — 超え strict), `first_above` (100,001 qualifies), `threshold_decoded` (十万円 = 100,000).
- Build: `lake build` → full build success (626 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The first two items of 第一条の二(1), the substantive rule this item gates, other
paragraphs, 省令 details, and the customs valuation rules themselves. This is a
computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_CUSTOMS_DUTIABLE_VALUE_THRESHOLD.md` (H/T/D/C/U per finding).
