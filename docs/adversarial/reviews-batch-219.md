# Adversarial review — batch 219

Mechanical (not human) re-extraction and cross-check of
CovidLocalTaxGrantThousandRounding against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### CovidLocalTaxGrantThousandRounding.lean — 新型コロナ地方税減収補塡特別交付金省令 第二条 第一項

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 新型コロナウイルス感染症対策地方税減収補塡特別交付金に関する
  省令 (law 504M60000008016), revision 504M60000008016_20220318_000000000000000.
- Source: data/raw/504M60000008016_20220318_000000000000000.law.json.
- 独立再抽出: walked `law_full_text` to the MAIN Article `Num=2`,
  `Paragraph#1`; scoped article 180 chars, needle occurs once. Sibling article 1
  and article 3(5) are negative controls (no needle, no 五百/千 band text).
- 数値: 「五百」 = 500 and 「千」 = 1000, both verbatim in the scoped article;
  `matched_spellings({500,1000}, text) == {'500':['五百'], '1000':['千']}`;
  `clause_correspondence` True. Neither is an article id or fiscal-year label.
- 計算: two-band rounding of `amount % 1000`: r<500 truncate, 500≤r<1000 raise
  to next 1000. Kernel-decided boundaries 0→0, 499→0, 500→1000, 999→1000,
  1000→1000, 1499→1000, 1500→2000. Applies in the calculation process and to
  the calculated amount, per the clause.
- Caveat recorded, not claimed as novelty: an older module
  `LocalTaxShortfallRounding` (different law) uses the same two-band skeleton.
  This is a distinct law/revision/cell pin; no global novelty claim.
- 独立仕様: specLower/specUpper/specRound independent; agree* use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（算定の過程・算定額の五百円未満切捨て、五百円以上千円未満は千円）,
  T（500, 1000, 五百, 千, bytes pinned）, D（rfl / decide）, C（scoped needle 一意、
  sibling negative、500/1000 境界、spec 独立性）, U（特別な定め、3〜4条の算定式、
  負・非整数、他法・法的効果は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
