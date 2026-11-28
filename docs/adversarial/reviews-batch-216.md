# Adversarial review — batch 216

Mechanical (not human) re-extraction and cross-check of
Reiwa8LocalGrantCoefficientScale against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### Reiwa8LocalGrantCoefficientScale.lean — 令和八年度分の地方交付税の交付額の特例に関する省令 第一条 第一項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 令和八年度分の地方交付税の交付額の特例に関する省令
  (law 508M60000008056), revision 508M60000008056_20260401_000000000000000.
- Source: data/raw/508M60000008056_20260401_000000000000000.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=1`, `Paragraph#1`,
  `ParagraphSentence#1`; scoped article 276 chars. The full sentence is the
  scoped text and occurs once; the sibling proviso (same paragraph) and the
  whole of Article 2 are negative controls for the coefficient.
- 数値: 係数「〇・二四八九七八七六三四」 = 2489787634 / 10^10. The statutory
  spelling has a leading `〇・` which `kanji_variants`/`int_to_kanji` do not
  produce; therefore correspondence uses the PINNED NEEDLE anchor path
  (`clause_correspondence(∅, text, [full-sentence])` True, coefficient verbatim
  in scoped article), NOT the spec-literal variant path. This is recorded
  explicitly rather than claimed via a weaker helper match.
- 計算: exact rational scaling, no rounding stated. `scaledNumerator p = p *
  2489787634` over denominator 10^10. Kernel-decided on Nat: numerator 0→0,
  numerator(10^10) = 2489787634 * denominator (exactness cross-check),
  monotonicity 1<2, coefficient < 1, coefficient > 0. Rat values are
  declarations only; no tactic beyond `decide` is used.
- Adversarial note: an earlier draft used `Rat` with `by decide`, which got
  stuck on reduction; it was replaced with Nat cross-multiplication proofs.
  The kernel rejected the unreduced proof, so the final proof is on Nat only.
- 独立仕様: specNum/specDen/specScaledNum independent; agree* use `rfl`/`rw`.
- 判定 (H/T/D/C/U): H（令和七年度分普通交付税額に〇・二四八九七八七六三四を乗じた額）,
  T（2489787634/10^10, 〇・二四八九..., bytes pinned）, D（rfl / decide on Nat cross-products）,
  C（pinned-needle correspondence、sibling negative、exactness cross-check、
  monotonicity、spec 独立性）, U（ただし書、地方交付税法16(1) 本体、2条の
  廃置分合、係数の予算算出、円未満端数、他法・法的効果は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
