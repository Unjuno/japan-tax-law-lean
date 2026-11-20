# Unit review — 地方税法 art. 74の5 (たばこ税の税率)

Normative unit id: `NORM|13ca7436618900441d6024641c3b92dbf2a9f48c038cee0927fb04970d4b22c6`
Law: `325AC0000000226` (地方税法), revision `325AC0000000226_20261101_508AC0000000002`,
enforcement 2026-11-01.
Source: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
Source path: `LawBody[2]/MainProvision/MainProvision[1]/Article:74_5/Article#74_5/
Paragraph#1/ParagraphSentence/Sentence#1`

Verbatim source (para 1): 「たばこ税の税率は、千本につき千七十円とする。」

## Source correspondence (independent of Lean)

Recorded machine-readably in `data/source_correspondence_local_tobacco_74_5.json`.

| field | value |
|---|---|
| H | the independent spec does not represent the ¥1,070/千本 rate in the pinned original |
| T | re-extract Article 74_5 from the pinned UTF-8 JSON, parse 漢数字 (千七十 → 1070), compare with the Lean constants |
| D | PASS — `verbatim_located=true`, `amounts_in_source=[1070]`, `missing_in_spec=[]`, `missing_in_impl=[]` |
| C | a matching numeral is necessary but not sufficient for semantic fidelity; the 千本 unit is recorded, not derived |
| U | variable meaning, unit (円/千本), and scope (rate constant only) require separate human review |

## Model and proof scope

- Implementation `JapanTaxLaw/LocalTobaccoTaxRate.lean`: `ratePerThousand : Money := 1_070`;
  boundary theorems (positive, rejects 1,000 and 10,700), all kernel-decided.
- Independent spec `JapanTaxLaw/LocalTobaccoTaxRateSpec.lean`: declares its OWN
  `specRateYen : Nat := 1_070` from 「千七十円」; `specRate_eq_impl` is `rfl`.
- Tests `JapanTaxLaw/LocalTobaccoTaxRateTests.lean`: 11 kernel-decided examples including
  boundary literals 0/1/11/12/13.
- Variables/units/domain: `thousandCigarettes : Nat` (caller-established); result unit is
  Money (= Nat, 円); domain is the per-1000-cigarettes flat rate.

## Not modelled (retained as unhandled scope)

課税標準（製造本数・移動本数）の認定、市町村間按分、他のたばこ税条項
（課税定額等）、附則・経過措置。This is a computable slice of one rate norm —
not an article-level or law-level completion claim.

## Verification status

`PROVED_SCOPE` pending the Lean kernel-build attestation for the new module blobs
(CI run 44695943806). Mechanical evidence is not back-dated. Human legal review
remains `LEGAL_REVIEW_PENDING`.
