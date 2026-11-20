# Adversarial Review — Batch 1（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）
- **性質: 機械的独立照合であり、人間の法解釈レビューではない。** 欠陥件数を手柄にしない。
- 手法: 各モジュールの doc-comment を信じず、pinned raw JSON の `law_full_text` を再帰平坦化し `Article` を `attr.Num` で定位、U+3000/空白を正規化して原文リテラル・式を抽出。pinned 原文から導いた整数式を自作 Python（approved temp dir、実行後に削除）で独立再実装し、`.lean`/`.Spec.lean`/`.Tests.lean` の `by decide`/`rfl` 期待値と照合。`transcription_audit.py` は未使用。
- H/T/D/C/U (Sponsor Directive §5): H=反証可能な仮説, T=再現テスト, D=判定(BY-DESIGN/CONFIRMED/UNRESOLVED), C=競合解釈, U=残存不確実性。

### DelinquencyTax.lean — 国税通則法 第60条(2)（延滞税）

- pin: law_id `337AC0000000066` / rev `337AC0000000066_20261101_507AC0000000013` / 施行 2026-11-01 / sha256 `6F8B43E1…89DEE`（実測一致・INVENTORY `source_sha256` 一致）。raw `data/raw/337AC…0013.law.json`、Article Num=`60`。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「年十四・六パーセントの割合を乗じて計算した額」 | 14.6%=146/1000 | `delinquencyHighRate`=⟨146,1000⟩ | ✅ |
  | 「年七・三パーセントの割合を乗じて計算した額」(ただし書) | 7.3%=73/1000 | `delinquencyLowRate`=⟨73,1000⟩ | ✅ |
  | 「納期限の翌日から二月を経過する日まで」 | caller-established Bool | `delinquencyRate(true/false)` | ✅ |
  | 数値関係 14.6 = 2 × 7.3 | 146 = 2×73 | `delinquencyHighRate_is_double_low` (rfl) | ✅ |
- 反例: ① `withinTwoMonths=true`→73/1000=**7.3%**（低率）; ② `false`→146/1000=**14.6%**（高率）; ③ 倍数境界 146=2×73。**3 点とも** `by decide`/`rfl` 期待値と一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。原文 4 断片存在（十四・六／七・三／二月を経過する日まで／割合を乗じて計算）。scope: 日割りの分母（年何日）は pinned 条文に明示なく未モデル化（政令・通達依存）、延滞税額本体（日数×税額×率）・art.60(1) の 5 号該当性・art.61/63・端数は非モデル化、転記監査は fidelity-only。
- H/T/D/C/U: H「高率=146/1000, 低率=73/1000, 高率=2×低率, 区分 bool 選択」/ T「上 3 境界 + `agreeDelinquencyTax`(4点)、全一致」/ D「BY-DESIGN」/ C「日割りは 365 日等もあり得るが原文に分母なしゆえ架空仮定を避ける」/ U「政令の日割り換算、art.61 期間特例・art.63 免除」。

### UnreportedSurcharge.lean — 国税通則法 第66条（無申告加算税）

- pin: law_id `337AC0000000066` / rev `…20261101_507AC0000000013` / 施行 2026-11-01 / sha256 `6F8B43E1…`（実測一致）。Article Num=`66`（1項・3項を定位）。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 1項「百分の十五…予知してされたものでないときは百分の十」 | 15%/10% | `unreportedSurchargeBasicRate(false/true)`=⟨15/10,100⟩ | ✅ |
  | 3項一「五十万円以下の部分…百分の十五」 | ≤500k×15% | `tierRate upTo500k false`=⟨15,100⟩ | ✅ |
  | 3項二「五十万円を超え三百万円以下の部分…百分の二十」 | (500k,3M]×20% | `tierRate over500kTo3m false`=⟨20,100⟩ | ✅ |
  | 3項三「三百万円を超える部分…百分の三十」 | >3M×30% | `tierRate over3m false`=⟨30,100⟩ | ✅ |
  | 3項「その割合から百分の五の割合を減じた割合」 | −5pt → 10/15/25% | `tierRate *_true`=⟨10,15,25,100⟩ | ✅ |
  | 3項「加算後累積納付税額が三百万円を超えるとき」 | しきい値 3,000,000 | `tieredSurcharge` の `t2=max(tax−3M,0)` | ✅ |
- 反例: ① 400k→400k×15%=**60,000**; ② 500k→**75,000**; ③ 2M→75k+1.5M×20%=**375,000**; ④ 3M→75k+2.5M×20%=**575,000**; ⑤ 4M→575k+1M×30%=**875,000**; ⑥ 軽減 4M→50k+375k+250k=**675,000**; ⑦ tax=1→**0**（切捨て）。**7 点とも** `by decide` 一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。6 リテラル原文存在（十五／十／二十／三十／五／三百万円）。scope: 3項の「合計額から累積納付税額の按分を控除」は政令依存の caller-established で未モデル化、2項(50万超5%加算)・5項以降・art.67/68 は非モデル化、端数は TaxRounding 射程（≤3M で 3項表 20%=15%+5% は 1項+2項と数値一致）。
- H/T/D/C/U: H「tieredSurcharge=Σ min/max 部分×区分率（軽減−5pt）」/ T「上 7 + `agreeUnreportedSurcharge`(9点×2)、全一致」/ D「BY-DESIGN」/ C「≤3M は 1項+2項でも計算し得るが 3項表と同値、控除順もあり得るが原文は合計−控除」/ U「累積納付税額の政令按分、2項の別ルート統合」。

### GiftAddBack.lean — 相続税法 第19条（相続開始前七年以内の贈与）

- pin: law_id `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008` / 施行 2026-04-01 / sha256 `C01BB9BE…43A7`（実測一致）。Article Num=`19`。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「開始前七年以内…開始前三年以内に取得した財産以外の財産」 | 3年/7年ウィンドウ | `GiftAddBackFacts` 2 バケット | ✅ |
  | 「価額の合計額から百万円を控除した残額」 | over3 − 1,000,000（Nat 飽和） | `giftAddBack` | ✅ |
  | 「加算した価額を相続税の課税価格とみなし」 | base + 加算 | `augmentedTaxableValue` | ✅ |
  | 「第十五条から前条まで…算出した金額から…贈与税の税額を控除」 | computed − giftTax（飽和） | `taxDueAfterGiftCredit` | ✅ |
  | 単一相続人 基礎控除（外部 pin `InheritanceTax`） | 30M+6M×1=36M | `inheritanceBasicDeduction 1` | ✅ |
- 反例: ① over3=1,000,001→加算 **1**; ② 1,000,000→**0**; ③ 900,000→**0**; ④ A: 5M+(8M−1M)=**12M**, augmented **112M**; ⑤ 単一相続人 112M−36M=76M → 10M×10%+20M×15%+20M×20%+26M×30%=1M+3M+4M+7.8M=**15,800,000**、控除2M→**13,800,000**。**5 点とも** `by decide` 一致（② は 413M→**164.5M** も確認）。
- 判定: **BY-DESIGN / CONFIRMED 0**。5 リテラル原文存在（七年／三年／百万円／控除した残額／十五〜前条）。scope: 「控除した残額」の 0 下限は Nat 飽和の modeling candidate、特定贈与財産(2項)・加算対象選別・贈与税の政令計算(21-8 控除前・附帯税除外)は caller-established、第51条2項手続は対象外、第15-18条算出は別モジュール pin 依存（本監査で定数確認）。
- H/T/D/C/U: H「加算=within3+(over3−1M)、納付額=算出−giftTax」/ T「上 5 + `agreeGiftAddBackPoints`(11点)、全一致」/ D「BY-DESIGN」/ C「1M 以下で負の残額をどう扱うかは明示 candidate に依存」/ U「政令の贈与税按分、特定贈与財産の金額選別、art.21-8 控除前税額」。

### GiftSpecialDeduction.lean — 相続税法 第21条の12（相続時精算課税の特別控除）

- pin: law_id `325AC0000000073` / rev `…20260401_506AC0000000008` / 施行 2026-04-01 / sha256 `C01BB9BE…`（実測一致）。Article Num=`21_12`。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 一号「二千五百万円」 | 25,000,000 | `giftSpecialDeductionLimit` | ✅ |
  | 一号「…控除した金額がある場合には、その金額の合計額を控除した残額」 | 25M − prev（Nat 飽和） | `min` の第1引数 | ✅ |
  | 柱書「…いずれか低い金額を控除する」+二号「…控除後の贈与税の課税価格」 | min(残額, price) | `giftSpecialDeduction` | ✅ |
- 反例: ① (10M,0)→min(25M,10M)=**10M**; ② (30M,0)→**25M**; ③ (20M,10M)→min(15M,20M)=**15M**; ④ (20M,25M)→**0**; ⑤ (20M,30M)→**0**; ⑥ (0,0)→**0**。**6 点とも** `by decide` 一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。3 リテラル原文存在（二千五百万円／控除した残額／いずれか低い金額）。scope: 控除上限の 0 下限は Nat 飽和、2項(申告書記載)・3項(やむを得ない事情)は適用要件で caller、端数は本条に記載なし、課税価格は art.21の11の二(1) の caller-established 値。
- H/T/D/C/U: H「控除=min(25M−prev, price)」/ T「上 6 + `agreeGiftSpecialDeduction`(7点)、全一致」/ D「BY-DESIGN」/ C「既控除合計>25M の残額は原文未定義につき 0 を candidate」/ U「既控除合計の政令上の算定、端数丸め」。

### GroupLossRatio.lean — 法人税法 第64条の7（欠損金の通算）

- pin: law_id `340AC0000000034` / rev `340AC0000000034_20261001_508AC0000000012` / 施行 2026-10-01 / sha256 `3B743C0F…F342`（実測一致）。Article Num=`64_7`（2項ハ・3項を定位）。
- 独立抽出:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 3項「当該合計額が零である場合には零とし」 | den=0 → 0 | `safeRatio` の `den=0` 分枝 | ✅ |
  | 3項「当該割合が一を超える場合には一とする」 | num>den → 1 | `safeRatio` の `else→1` | ✅ |
  | 3項「…占める割合…を乗じて計算した金額」（特定損金算入限度額） | num/den（Nat 切捨て） | `safeRatio` の `num≤den→num/den` | ✅ |
  | 2項ハ「（１）に掲げる金額に（２）…割合を乗じて計算した金額」（非特定欠損金配賦額） | pool×safeRatio | `nonSpecificAllocation` | ✅ |
- 反例: ① `safeRatio(3,0)`=**0**; ② (1,2)=**0**（切捨て）; ③ (2,2)=**1**; ④ (5,2)=**1**（cap）; 配分 100×ratio(2,2)=**100**, 100×ratio(1,2)=**0**, 100×ratio(3,0)=**0**。**7 点とも** `by decide` 一致。
- 判定: **BY-DESIGN / CONFIRMED 0**。原文 4 断片存在（零→零／一超→一／割合を乗じて／所得合計額）。scope: 割合を Nat で表現し 1 未満は切捨て（例 `nonSpecificAllocation(250,3,4)`=0、真値 187.5 と不一致）は明記された設計、art.64の7 全体（約9163文字）の配分・期間特定・4 除外・損金算入限度額キャップは非モデル化、政令委任の丸め・按分は caller-established。
- H/T/D/C/U: H「safeRatio = den=0?0 : num≤den?num/den : 1；alloc=pool×safeRatio」/ T「上 7 + `agreeGroupLossRatio`(8+5点)、全一致」/ D「BY-DESIGN」/ C「割合を分数のまま掛ける順序もあり得るが原文は『割合を乗じて』、Nat 切捨ては明記 discipline」/ U「政令の丸め、配分全体・期間特定の実装」。

---

注: 本レビューは pinned e-Gov 原文との機械的独立照合であり、法解釈の正しさや網羅性を保証する人間の法務レビューではない。全 5 モジュールで反証可能な仮説・再現テストは原文および `by decide` 期待値と一致し、CONFIRMED な欠陥・UNRESOLVED は認められなかった（BY-DESIGN の scope 限制は各節に明記）。
