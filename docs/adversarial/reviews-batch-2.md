# Adversarial Review — Batch 2（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）
- **性質: 機械的独立照合であり、人間の法解釈レビューではない。** 欠陥件数を手柄にしない。
- 手法: 各モジュールの doc-comment を信じず、pinned raw JSON の `law_full_text` を再帰平坦化し `Article` を `attr.Num` で定位、U+3000/空白を正規化して原文リテラル・式を抽出。pinned 原文から導いた整数式を独立 Python で再実装し、Lean の `by decide` 期待値と照合（**全 75 点一致・矛盾 0**）。一時スクリプトは approved temp dir に置き削除済み。
- H/T/D/C/U (Sponsor Directive §5): H=反証可能な仮説, T=再現テスト, D=判定(BY-DESIGN/CONFIRMED/UNRESOLVED), C=競合解釈, U=残存不確実性。

### CorporateGroupLossOffset.lean — 法人税法 第64条の5(2)(4)

- pin: law_id `340AC0000000034` / rev `340AC0000000034_20261001_508AC0000000012` / 施行 2026-10-01 / sha256 `3B743C0F…F342`（実測一致）。raw `data/raw/340AC…0012.law.json`、Article Num=`64_5`（2項・4項を定位）。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「第一号に掲げる金額に第二号…第三号…割合を乗じて計算した金額をいう」 | min(pl,tgi)×oi÷tgi | `intercompanyLossDeduction` | ✅ |
  | 「合計額が第三号…超える場合…超える部分を控除した金額」 | min(partnerLosses,totalGroupIncome) | `pooledIntercompanyLoss` | ✅ |
  | 「通算法人の所得事業年度の通算前所得金額」/「…合計額」 | ownPreTransferIncome / totalGroupPreTransferIncome | 同フィールド | ✅ |
  | §4 一号/二号/三号（対称） | min(pi,tgl)×ol÷tgl | `intercompanyIncomeInclusion` / `pooledIntercompanyIncome` | ✅ |
- 反例: ① ⟨80,100,80⟩→min(100,80)=80→**80**; ② ⟨400,100,300⟩→400×100÷300=**133**（切捨て）; ③ §4 ⟨0,0,0,100,500,100⟩→min(500,100)=100→**100**。全て `by decide` と一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。doc-comment 逐語引用は pinned 原文に完全一致（主要リテラル存在確認）。scope: 通算前所得/欠損は art.57(1) 未適用の caller-established 値、通算完全支配関係・基準日・親子区分は caller 事実、art.64の5(5)-(9)・第五/六号・配分順序は非モデル化、割合は Nat 除算の切捨て（政令の按分細目は caller 選択）。
- H/T/D/C/U: H「§2/§4 式は min(一号,三号)×二号÷三号」/ T「上 3 境界 + Spec 11 点 agree、全一致」/ D「BY-DESIGN」/ C「割合を先に切捨てる順序もあり得るが原文は割合を乗ずる形で乗→除が忠实」/ U「政令の按分・端数詳細、複数社配分の順序・決定性」。

### CorporateLossCarryforward.lean — 法人税法 第57条

- pin: law_id `340AC0000000034` / rev `…20261001_508AC0000000012` / 施行 2026-10-01 / sha256 `3B743C0F…`（実測一致）。Article Num=`57`。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「…十年以内に開始した事業年度において生じた欠損金額…損金の額に算入する」 | lossAvailable | `lossCarryforwardDeduction`=min(loss,cap) | ✅ |
  | 「所得の金額の百分の五十に相当する金額」 | income×50÷100 | `lossDeductionCapBase` | ✅ |
  | 「…限度額から…前の事業年度…損金算入される金額を控除した金額を超える場合…」 | cap−already（Nat 飽和） | `effectiveLossCap` | ✅ |
  | 11項「『…百分の五十に相当する金額』とあるのは『所得の金額』とする」 | carveOut→income | `carveOutApplies` / `lossDeductionCapBase` | ✅ |
  | 11項一号「資本金…一億円以下」/二号再生/三号「七年を経過する日」 | 3 Bool の OR | 同 3 フィールド | ✅ |
- 反例: ① (10M,6M,0,非SME)→**5M**（50% が効く）; ② (10M,6M,8M)→上限 5M−8M→**0**（飽和）; ③ (10M,6M,0,SME)→**6M**（読替）。補: 9,999,999→**4,999,999**（切捨て）。全て一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。5/5 リテラル原文存在。scope: 右記の所得は本文・59(3)(4)・62の5(5) を適用しない計算値（caller 供給）、§11 該当性 3 Bool は caller、連続青色申告/帳簿保存（§10）・§2-10/12-14・art.59 は非モデル化、Nat 減算の 0 下限・百分の五十の切捨ては設計。
- H/T/D/C/U: H「控除=min(欠損, (carveOut? 所得 : 所得×50/100)−既使用)」/ T「上 3 + 10 点、agreeLossCarryforwardPoints(全 56 組合せ) 一致」/ D「BY-DESIGN」/ C「既使用控除の順序も整理し得るが原文は『限度額から…控除した金額』の順序」/ U「§11 一号の大通算法人除外判定、端数処理の政令委任」。

### DisasterLossDeduction.lean — 地方税法 第34条(1)第一号

- pin: law_id `325AC0000000226` / rev `…20261101_508AC0000000002` / 施行 2026-11-01 / sha256 `3DD29E00…6D53`（実測一致）。Article Num=`34`、1項第一号 イ/ロ/ハ を定位（原文は Column 入れ子）。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | イ「…災害関連支出の金額が五万円以下…（ない場合を含む）」→「…合計額の十分の一」 | th=totalIncome×10÷100 | `disasterLossDeductionThreshold` / `tenth` | ✅ |
  | ロ「合計額から…五万円を超える部分を控除した金額とイ…いずれか低い金額」 | min(loss−(spend−50k), イ) | 同（else 分枝） | ✅ |
  | ハ「五万円とイ…いずれか低い金額」 | min(50k, イ) | 同（第2 分枝） | ✅ |
  | 「…定める金額を超える場合におけるその超える金額」 | max(0, loss−th) | `disasterLossDeduction` | ✅ |
- 反例: ① (1M,100k,0)→th=100k→**0**（閾値一致）; ② (1M,200k,80k)→min(170k,100k)=100k→控除**100k**; ③ (1M,80k,80k)→ハ min(50k,100k)=50k→**30k**。支出 50,000→50,001 も双方 th=100k。全て一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。4 リテラル原文存在（イは定義句挿入を考慮した完全一致文字列で確認）。ロ/ハ は loss=spend のとき同値となり優先順の影響なし（独立確認）。scope: 災害関連支出額・対象資産適格性は caller、保険金等で埋戻し後金額を caller が `disasterLossTotal` に含める、34(1)第十一号の控除順序・総控除限度は非モデル化。
- H/T/D/C/U: H「th=ケース別 min(…,イ)、控除=max(0,loss−th)」/ T「上 3 + 6 境界、agreeDisasterLossDeductionPoints(10 点) 一致」/ D「BY-DESIGN」/ C「ロとハの重複は同値ゆえ競合しない」/ U「政令で定める金額の詳細、保険金控除の算定」。

### InheritanceSuccessiveDeduction.lean — 相続税法 第20条

- pin: law_id `325AC0000000073` / rev `…20260401_506AC0000000008` / 施行 2026-04-01 / sha256 `C01BB9BE…43A7`（実測一致）。Article Num=`20`。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 一号「…第一次…価額から…相続税額を控除した金額に対する割合」「…百分の百を超える場合…百分の百」 | r1=min(second×10^5/firstNet, 10^5) | `successiveRate1` | ✅ |
  | 二号「…の…合計額に対する割合」（上限規定なし） | r2=thisHeir×10^5/second | `successiveRate2` | ✅ |
  | 三号「十年から控除した年数（一年未満/端数は一年とする）の十年に対する割合」 | r3=max(0,10−years)/10 | `successiveRate3` | ✅ |
  | 柱書「…割合を順次乗じて算出した金額を控除した金額」 | base×r1×r2×r3（各段切捨て） | `successiveDeduction` / `taxWithSuccessiveDeduction` | ✅ |
- 反例: ① r1(150,100)=**100,000**（上限）; ② r2(150,100)=**150,000**（原文に上限なし、不正入力）; ③ r3(9)=**10,000**, r3(10)=**0**; 連鎖 (1M,2M,2M,1M,5)→**250k**。全て `by decide` 一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。3/3 リテラル原文存在。scope: 3 因子は供給値上の純算術で時の検証なし、r1 分母 0 は原文未定義につき 100,000 を modeling candidate、r3 は整数年のみ（「一年未満の端数切上」は caller が丸めた年を渡す前提）、百分率を 10^5 固定小数で表現、10 年適格要件は入力ガードせず 0 に飽和。
- H/T/D/C/U: H「税額=art15-18額 − firstTax×r1×r2×r3」/ T「上 3 + 18 点、agreeInheritanceSuccessiveDeduction(9 点) 一致」/ D「BY-DESIGN」/ C「分母 0 は別解釈があり得るが明示的 candidate」/ U「端数年（1 年未満切上）の前段丸め、第一次税額の延滞/加算税除外の算定」。

### SpousalGiftDeduction.lean — 相続税法 第21条の6

- pin: law_id `325AC0000000073` / rev `…20260401_506AC0000000008` / 施行 2026-04-01 / sha256 `C01BB9BE…`（実測一致）。Article Num=`21_6`。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「婚姻期間が二十年以上である配偶者から…取得した者（…前年以前…適用を受けた者を除く）」 | isSpousalGift20Year ∧ ¬priorApplication ∧ providesResidence | `spousalDeductionQualifies` | ✅ |
  | 「課税価格から二千万円（…合計額が二千万円に満たない場合には、当該合計額）」 | min(20M, res+cash) | `spousalDeduction` / `spousalDeductionBasis` | ✅ |
  | 「居住用不動産の価額に相当する金額と…金銭のうち…充てられた部分の金額との合計額」 | res + cashAppliedToResidential | `spousalDeductionBasis` | ✅ |
  | 「翌年三月十五日までに…居住の用に供し…見込み」 | providesResidenceByNextMarch | 同 Bool | ✅ |
- 反例: ① basis ちょうど 20M → **20M**（「満たない」でない）; ② basis 12M → **12M**; ③ 適格ゲート false / basis 0 → **0**。giftTaxableValue < 控除額なら saturating 減算で 0。全て一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。4/4 リテラル原文存在。scope: 婚姻 20 年・前年適用歴・3/15 居住見込みは caller Bool、§2/§3 の添付手続・§4 政令委任・資産評価は非モデル化、giftTax 合成（art.21-5/21-7）は別モジュール pin に依存し本バッチの再検証外。
- H/T/D/C/U: H「控除=適格? min(20M, res+cash) : 0」/ T「上 3 + 4 点、agreeSpousalGiftPoints(7 点) 一致」/ D「BY-DESIGN」/ C「控除順（21-6→21-5）は飽和 Nat 減算で可換」/ U「婚姻期間の政令判定の詳細、giftTax 側の税率表再検証」。

---

## 一行 verdict（Batch 2）

- **CorporateGroupLossOffset.lean — BY-DESIGN / CONFIRMED 0**（64の5(2)(4) の min×割合、pinned 原文と一致）。
- **CorporateLossCarryforward.lean — BY-DESIGN / CONFIRMED 0**（art.57 の 50% 上限・§11 読替、pinned 原文と一致）。
- **DisasterLossDeduction.lean — BY-DESIGN / CONFIRMED 0**（地方税法 34(1)一 イ/ロ/ハ 閾値、pinned 原文と一致）。
- **InheritanceSuccessiveDeduction.lean — BY-DESIGN / CONFIRMED 0**（相続税法 20 の 3 因子、pinned 原文と一致；整数年・分母 0 は明示的 scope）。
- **SpousalGiftDeduction.lean — BY-DESIGN / CONFIRMED 0**（相続税法 21-6(1) の 2,000 万円 cap、pinned 原文と一致）。

 UNRESOLVED は全モジュール共通で上記 U 欄のとおり（政令委任の細目・他の pin モジュール依存）。いずれも pinned 原文との食い違い（誤訳・桁違い・率違い）ではなく、明示された境界である。

書き込みは本ファイルのみ。Lean / Spec / Tests / `data/*.json` / `scripts/*.py` / `docs/ADVERSARIAL_REVIEW.md` は読み取り専用、commit / push なし。
