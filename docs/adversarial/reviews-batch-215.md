# Adversarial review — batch 215

Mechanical (not human) re-extraction and cross-check of
ForeignVessel24HourDeparture against the pinned source. Reproducible from
committed bytes; NOT a human legal review. No approval field recorded; legal
review stays LEGAL_REVIEW_PENDING.

### ForeignVessel24HourDeparture.lean — 関税法施行規則 第二条の二 第三項 第四号

BY-DESIGN / 照合 (CI attestation + evidence wiring follow in separate commits).

- 一次資料: 関税法施行規則 (law 341M50000040055), revision
  341M50000040055_20260601_508M60000040016.
- Source: data/raw/341M50000040055_20260601_508M60000040016.law.json.
- 独立再抽出: walked `law_full_text` to Article `Num=2_2`, `Paragraph#3`,
  `Item#4`, `Column#1`; scoped article 2,735 chars. The full unit text is
  verbatim-equal to the scoped column text and occurs once. Sibling items 1/2/3/5
  in the same paragraph are negative controls: item 3 uses 十四日以内, item 5
  uses 三十分; none contains 二十四 or the needle.
- 数値: 「二十四」 = 24 (`int_to_kanji(24) == '二十四'`;
  `kanji_variants(24) == {'二・四','二十四'}` but `matched_spellings({24}, text)
  == {'24': ['二十四']}` — the `二・四` variant is absent, so verbatim spelling is
  unambiguous). `clause_correspondence({24}, text, …)` True. Sole numeral.
- 計算: `within24h h = h <= 24` (「以内」 inclusive). Kernel-decided: 0/1/23/24
  true, 25/100 false. Boundary at exactly 24 is true, the decisive case.
- Distinct pattern: hour-granularity inclusive window; no existing 24-hour
  statutory-window module (deadline modules are day-granularity).
- 独立仕様: spec24/specWithin24 independent; agreeLimit/agreeWithin use `rw`/`rfl`.
- 判定 (H/T/D/C/U): H（入港の時から二十四時間以内の出港）, T（24, 二十四, bytes
  pinned）, D（rfl / decide）, C（scoped needle 一意、sibling negative、上限
  inclusive 境界、spec 独立性）, U（貨物積卸しの有無判定、船舶・旅客区分、
  届出義務、暦日繰越・分秒・時差、3号十四日・5号三十分、法的効果・承認は非介入）。
- 本レビューは機械的であり、人間による法解釈・目視確認ではない
  (legal review remains LEGAL_REVIEW_PENDING)。
