# Adversarial review — batch 47

### AviationFuelTaxAmountFloor.lean — 国税局課税部等所掌事務範囲省令 第二条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="2"` を定位（構造ヒット 1 件、law_full_text/children[1]/children[2]/children[1]）・原文照合。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/352M50000040032_20220710_504M60000040044.law.json`（law 352M50000040032, revision 352M50000040032_20220710_504M60000040044, enforcement 2022-07-10, MinisterialOrdinance）。
- SHA-256 再計算: `d626cf16d9fed1f7c4c51c463edd7e23b40bd66063cbbd79f3fe3055324610ed`（生バイト 62480 バイト）→ CONFIRMED。
- Article 定位: `Num="2"` を構造走査で 1 件検出 → CONFIRMED。
- 逐語照合: needle「当該積込みの場所において一年中に航空機に積み込まれた航空機燃料に係る航空機燃料税の額に相当する金額が五千万円以上であること」は当該 Article ノード内に verbatim 1 回、原文全体でも 1 回（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 五千万 = 50,000,000（自前の 万/億 対応 kanji→int 変換器で検算、5×10^7）。impl `amountFloor` / spec `specFloor` = 50_000_000 と一致 → CONFIRMED。
- 境界照合 (≥3): 0 円 → false、49,999,999 円 → false、50,000,000 円 → true、50,000,001 円 → true（小入力 1, 2 → false も確認）。impl↔spec 一致も全点で確認、矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specFloor=50_000_000 と被演算子反転 `¬ amount < specFloor` のみで、独立 def に impl 識別子なし。普遍定理 agreeFloor は unfold 後の純粋 `simp [Nat.not_lt]` で by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, at_floor, just_below, just_above, impl_spec_agreement}（≥3）、`spec_literals` = {50000000}、`source_literals_verified` True（原文の「五千万」を 万/億 対応変換器で直接照合）→ CONFIRMED。
- 橋渡し: agreeFloor の本体は `unfold meetsFloor specMeets amountFloor specFloor` + `simp [Nat.not_lt]` のみ。Nat.not_lt により `¬ amount < 50000000` → `50000000 <= amount` へ書き換わり、追加公理なしのカーネル橋渡し → CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値下限 五千万円 = 50,000,000 円と「以上」= 包含 >= のみをモデル化。積込み場所・一年の集計期間・担当官署の権限・列挙項目・他条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二条の「航空機燃料税の額に相当する金額が五千万円以上であること」という明示的数値下限のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算。
- D（導出）: 五千万 → 50,000,000。impl は `>=`、spec は `¬ amount < specFloor`。橋渡しは普遍定理かつ `simp [Nat.not_lt]` のみで公理を導入しない。
- C（整合）: 0 / 49,999,999 / 50,000,000 / 50,000,001 円、小入力、saturation、impl↔spec 一致を全て `by decide` または普遍定理で確認、矛盾 0。
- U（範囲外）: 積込み場所・一年の集計窓・担当官署の所掌・列挙項目・実数・負の値（Nat 前提）・他条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
