# Adversarial review — batch 161

## Scope

Mechanical (not human) re-extraction and cross-check of the pinned source
artifact for AreaMultiplierSixTwo.lean and its independent Spec/Tests modules.
Every claim below is reproducible from committed bytes.

### AreaMultiplierSixTwo.lean — 滅失建物等 第三十一条（面積六倍・特例二倍）

BY-DESIGN / CONFIRMED — 独立再抽出（一次資料）による照合・判定。

- 一次資料: law id 423CO0000000112, revision 423CO0000000112_20260401_508CO0000000102
- Source: data/raw/423CO0000000112_20260401_508CO0000000102.law.json
- SHA-256: d1e8cc26fcec663e706cec8859f4175d1c282f5670bd21a9649d786836db6964 (SHA-256 照合 OK)
- Article Num: 31 (第三十一条). Scoped Article 31 = 384 chars; needle 1 箇所一致を照合。
- Needle verbatim in scoped Article 31:
  「り当該共用部分の床面積を按あん分して計算した面積を含む。））に六（前条第三項第一号の建物にあっては、二）を乗じて計算した面積と当該滅失建物等の敷地の用に供されていた土地の面積とのいずれか大きい面積とする。」
- Statutory literals 六 = 6 (general), 二 = 2 (前条第三項第一号の建物) — both confirmed in the needle;
  independent spec_literals = {6, 2}, source_literals_verified True,
  parse_statutory_rate is None (no 百分の rate in this clause).
- Conditional multiplier (if isSpecial then 2 else 6) * area — BY-DESIGN, NOT a
  threshold / cap / ratio / rounding / tier; the max-with-land-area comparison and
  床面積の按あん分 are 非介入 (U).
- 境界カテゴリ (>=3): zero (0), small_input (1/2/3/5/6/7/10), saturation (0),
  threshold_below (1, 5), threshold_at (2, 6), threshold_above (3, 7) — all kernel-decided examples.
- 独立仕様: specGeneral / specSpecial / specMultiply defined without implementation identifiers;
  bridges agreeGeneral / agreeSpecial / agreeMultiply are `unfold ... ; rfl` only.
- 判定 (H/T/D/C/U): H（第三十一条の明示的条件付き乘数 六／二）, T（6 と 2、needle 逐語、SHA-256 で bytes pinned）,
  D（rfl / by decide のみ）, C（needle verbatim、境界カテゴリ 6 種、spec independence 確認）,
  U（敷地面積との比較・按分・他条は非介入）。
- H/T/D/C/U 判定は BY-DESIGN / CONFIRMED。
- 本レビューは機械的検出であり、人間による法解釈・目視確認ではない (mechanical, not human)。
