# Unit review — 地方税法 art.180(3)（百アール未満の端数は百アールとみなす）

Normative unit id: `NORM|926a979408404763d53009242e359b92c26e5b2abb2ebada6c8ca095f50419db`

Law: 325AC0000000226 (地方税法), revision
`325AC0000000226_20261101_508AC0000000002`,
snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「第一項の場合において、百アール未満の端数は、百アールとみなす。」

Exact source position (from the generated queue):
`LawBody[2]/MainProvision/MainProvision[1]/Article:180/Article#180/Paragraph#3/ParagraphSentence/Sentence#1`.
Norm kind: **DEEMING** (端数を.One unit とみなす / rounding fiction).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.180(3) deems any fractional part of less than 100 ares to be exactly 100 ares; a zero fraction is deemed zero (there is no fraction to round up). Unit: アール (ares), not yen. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「地方税法 art.180(3)（百アール未満の端数は百アールとみなす）↔ LocalTaxAresRounding.lean (fractionUnitAres 100)」 pinned to law 325AC0000000226, article locator 第百八十条, needle with terminal 「。」. Full-file count of the needle is 1 and it appears inside 第百八十条 / Paragraph 3. |
| D (decision) | PASS — audit reports `175/175 checks passed`. |
| C (competing interpretation) | 「百アール未満の端数」 could be misread as a money amount; the unit アール and the 「未満」 comparison confirm an area fraction under 100 ares. A zero fraction is not 「端数」 in the rounding sense, so it is deemed zero. Only the deeming sub-rule is modelled — the art.180(1) tax-base calculation and 政令 details are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxAresRounding.lean` —
  `fractionUnitAres : Money := 100`,
  `deemedFraction r = if r = 0 then 0 else 100`.
  `Money` is reused as a plain Nat count whose unit here is アール, not yen
  (documented in the module header).
- Independent spec: `specDeemed` is a structural pattern match
  (`0 → 0`, successor → 100) — deliberately different from the `if` on equality.
- Kernel proof: `agree_ares_rounding` proves equivalence for **all** Nat remainders
  by case analysis (not a finite sample). Boundary theorems establish
  `no_fraction_is_zero` (0), `smallest_fraction_is_unit` (1),
  `largest_fraction_is_unit` (99), and `deemed_fraction_bounded`.
- Build: `lake build` → **575 jobs, success**; axiom probe: `propext` for the
  equivalence and boundedness theorems, boundary theorems axiom-free,
  no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The art.180(1) tax-base computation, the other paragraphs of art.180, the
other articles of 地方税法 and all 政令 details. This is a computable slice of
one deeming norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_LOCAL_TAX_ARES_ROUNDING_180_3.md` (H/T/D/C/U per finding).
