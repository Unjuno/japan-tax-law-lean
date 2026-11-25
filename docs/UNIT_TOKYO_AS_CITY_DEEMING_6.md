# Unit review — 特別とん譲与税法 art. 6(1)（都を市とみなす / DEEMING）

Normative unit id: `NORM|1a2cafd55f792102d5682dcc811260486c83126edbf8985d8a31d64c3eddb32f`
Law: 特別とん譲与税法 (`332AC0000000077`),
revision `332AC0000000077_20010106_411AC0000000160` (`CurrentEnforced`).
Source: `data/raw/332AC0000000077_20010106_411AC0000000160.law.json`
SHA-256 (CRLF→LF): `c24ccc49c14a5d0e9f626f02635e3ee6d90587628e5aba803ca5e31a33bf112d`
Provision: `LawBody[1]/MainProvision/MainProvision[6]/Article:6/Article#6/Paragraph#1/ParagraphSentence/Sentence#2`

Verbatim (DEEMING): 「この場合においては、都を市とみなして、この法律の規定を適用する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The sentence establishes a legal fiction: 都 is read as 市 for the application of this Act. Coded as a municipality-kind map `0 (都) → 1 (市)`; other kinds preserved. The numerals are kind codes, not statutory amounts (the clause has no number). |
| T | `scripts/ci/transcription_audit.py` + `data/TRANSCRIPTION_PINS/TokyoAsCityDeeming.json` needle, scoped to `第六条` (Num 6, MAIN provision). Independent audit: needle count whole law = 1, scoped = 1. |
| D | PASS — needle verbatim-unique in the pinned law; SHA-256 and revision match INVENTORY; no blocking transcription defect. |
| C | 附則 has no duplicate of this sentence. The `CONDITION`/`REFERENCE` labels on the same sentence are not modelled; only the DEEMING substitution is in scope. |
| U | The trigger 「この場合」 (preceding context) is not modelled; it requires its own unit. Human legal determination remains pending (`LEGAL_REVIEW_PENDING`). |

## Model and proof

- Impl: `JapanTaxLaw/TokyoAsCityDeeming.lean` — `asCityCode : Nat → Nat | 0 => 1 | n+1 => n+1`, with `tokyo_becomes_city`, `city_preserved`, `prefecture_preserved`, and universal `idempotent` (all by `rfl` / `cases`).
- Independent spec: `JapanTaxLaw/TokyoAsCityDeemingSpec.lean` — `specAsCityCode c = if c = 0 then 1 else c`, a propositional-equality formulation reusing no implementation definition and using different operators.
- Universal kernel proof: `agree_as_city_code (c : Nat) : asCityCode c = specAsCityCode c` — holds for every Nat, not a finite sample; axiom-free (`cases` + `rfl` only; no `simp`, no `Classical.choice`). The first CI attempt with a Bool `==` / `simp` proof was rejected by the axiom audit and was replaced before any attestation was made.
- Tests: `JapanTaxLaw/TokyoAsCityDeemingTests.lean` — 12 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: the triggering condition, the grant amount computation, the remaining provisions of this article, other articles, and all other laws. Human legal review remains `LEGAL_REVIEW_PENDING`; this document records technical source/spec/proof correspondence only.
