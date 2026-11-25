# Unit review — たばこ税法施行規則 art.4(2)（一銭未満端数控除 / CONDITION）

Normative unit id: `NORM|7a6d882c8e0c966f7b5766ffacaf1989e44a24f68a38a98b6039edbea15bd02c`
Law: たばこ税法施行規則 (`360M50000040001`), revision `360M50000040001_20240401_506M60000040021` (`CurrentEnforced`).
Source: `data/raw/360M50000040001_20240401_506M60000040021.law.json`
SHA-256 (CRLF→LF): `4f4af1cb9f0b4ebb9799cc8438921bf7ef1fcfe8c0038043990e0e2be27237e5`
Provision: `LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1`

Verbatim (CONDITION): 「前項の計算に関し、同項各号に掲げる金額に一銭未満の端数がある場合には、その端数を切り捨てるものとする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | A fraction strictly below one 銭 is discarded; the whole-銭 amount is preserved. `(sen : Nat, hasFraction : Bool)` → `sen`. 「一銭」 is a unit, not a statutory amount literal. |
| T | Pin + `transcription_audit.py` needle scoped to `第四条`. Independent audit: needle count whole law = 1, scoped (393 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. The preceding paragraph's computation is not modelled. |
| U | 前項の金額算定本体 requires its own unit. Human legal determination remains `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `OneSenFractionTruncation.lean` — `floorToSen sen f := sen`, with `fraction_dropped` and `no_fraction_unchanged` (by `rfl`).
- Independent spec: `OneSenFractionTruncationSpec.lean` — `specFloorToSen sen f := match f with | true => sen | false => sen`, no impl definitions reused.
- Universal kernel proof: `agree_floor_to_sen (sen : Nat) (f : Bool)` — axiom-free (`cases f <;> rfl`).
- Tests: 10 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: 前項の計算, item amounts, taxpayer identity, tax amount, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
