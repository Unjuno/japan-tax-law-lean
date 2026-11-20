# Unit review — 地方揮発油税法 art. 4 (¥4,400 per kilolitre)

Normative unit id: `NORM|7eb549f9aeb97856ee098142bf07352e2d9dd52855e9afdd5db3e8c5236a64f8`

Law: 330AC0000000104 (地方揮発油税法), revision
`330AC0000000104_20260401_508AC0000000012`, enforcement 2026-04-01,
snapshot `data/raw/330AC0000000104_20260401_508AC0000000012.law.json`,
sha256 `c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a`.

Verbatim source text: 「地方揮発油税の税率は、揮発油一キロリットルにつき四千四百円とする。」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#1/ParagraphSentence/Sentence#1`.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The model constant is ¥4,400 charged per kilolitre of gasoline (揮発油一キロリットルにつき). The computed function `k × 4,400` is linear in the caller-supplied quantity; 第三条 課税標準 determination is out of scope. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「地方揮発油税法 art. 4…」 pinned to law 330AC0000000104, article locator 第四条, needle including the terminal 「。」. Independent full-file walk: needle occurs **once**, numeral 「四千四百円」 occurs **once**, both in 第四条. |
| D (decision) | PASS — needle found in the pinned article; audit reports `172/172 checks passed`. |
| C (competing interpretation) | 「四千四百円」 could appear in another law's fee schedule; a repo-wide numeric match would mislocate it. Within this pin it is unique, but the unit is pinned by law id + revision + 第四条 + structural path + source digest, not by the number alone. Other provisions (第三条〜第十五条, 附則) are distinct norms and are NOT modelled. Notably 第七条 contains a rate-derived rule (納付額の二百八十七分の四十四) that is a separate norm, not modelled here. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Determination of 課税標準, 納税義務者, 未納税移出等, 申告及び納付等, 担保の提供, 戻入れの場合の控除等, 延滞税, 加算税・罰則 and 附則・経過措置 are out of scope. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalGasolineTaxRate.lean` — `ratePerKilolitre : Money := 4_400`,
  `taxForKilolitres k = k * ratePerKilolitre`.
- Independent spec: `JapanTaxLaw/LocalGasolineTaxRateSpec.lean` — `specSum` is
  primitive-recursive repeated addition of ¥4,400, a deliberately different
  formulation from the implementation's multiplication.
- Kernel proof: `agree_local_gasoline_tax` proves equality for **all** `Nat`
  quantities by induction (no finite enumeration); plus `specSum_zero`,
  `specSum_pos_of_pos`, `taxForKilolitres_mono`, `rate_not_scaled` (rejects
  ten-fold transcription errors) and kernel-decided boundary examples.
- Build: `lake build` → **566 jobs, success**; no `sorry`/`admit`/`axiom`.
- Axiom probe: `agree_local_gasoline_tax` depends on `propext` only; the other
  four theorems depend on no axioms; **no `sorryAx`, no `Classical.choice`**.
- Tests: `JapanTaxLaw/LocalGasolineTaxRateTests.lean` — 0, 1, 2, 3, 100 kL,
  all kernel-decided.

## Not modelled (explicitly retained as unhandled scope)

第三条（課税標準）, 第五条（納税義務者）, 第六条（未納税移出等）,
第七条（申告及び納付等, including the 二百八十七分の四十四 rate interaction）,
第八条（担保の提供）, 第九条（戻入れの場合の地方揮発油税の控除等）,
第十条（延滞税）, 第十一条〜第十五条, 附則 経過措置. This is a computable slice
of one norm unit, not an article-level or law-level completion claim. Human
legal review is pending.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_LOCAL_GASOLINE_TAX_RATE_4.md` (H/T/D/C/U per finding).
