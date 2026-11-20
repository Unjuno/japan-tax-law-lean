# Adversarial Review — Batch 3 (2026-11-21)

- 役割: Adversarial Review Agent（形式化担当から独立）。**読み取り専用**; Lean / `data/*.json` / `scripts/*.py` / `docs/ADVERSARIAL_REVIEW.md` は一切変更していない。
- 方法: 各 `.lean` の doc-comment は**信じず**、pinned の `data/raw/*.law.json` を自前 Python で直接 parse。`law_full_text` を再帰 flatten し `Article` の `Num` 属性で本文を定位（複数一致は本文 Chapter 配下 index 0 を採用）、U+3000 と空白を正規化して原文リテラル・式を抽出。`.lean` / `.Spec.lean` / `.Tests.lean` の定数・式と照合し、独立 Python 再計算で境界値を検算して kernel-decided `example` と比較（`transcription_audit.py` は未使用）。
- pin 独立検証: consume sha256 `25DCCEBF…A82`（doc-comment と一致）、localtax `3DD29E00…D53`（一致）、localcorp `263518E1…D2`（doc-comment に sha 記載なし）。law_id も JSON 本文と一致。
- 一時スクリプトは `D:\CodexData\Temp\opencode` に置き、レビュー後に削除。独立再計算は計 **79 点 / MISMATCH 0**。
- **本レビューは機械的独立照合（原文 parse・定数照合・境界走査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

---

### ConsumptionTaxImportBase.lean — 消費税法 第28条第4項

**Pinned**: law_id `363AC0000000108`; revision `363AC0000000108_20261101_507AC0000000013`; sha256 `25DCCEBF…A82`; src `data/raw/363AC0000000108_20261101_507AC0000000013.law.json`。本文 `Article Num="28"`（第二章）Paragraph `Num="4"`、4 matches 中 index 0。

**独立抽出**:
| 原文 literal（Para4） | 独立計算 | Lean 定数 / 式 | 照合 |
|---|---|---|---|
| 「…算出した価格に…消費税以外の消費税等…の額…及び関税の額…に相当する金額を加算した金額」 | `a+b+c` | `importTaxableBase = customsValue+otherConsumptionTax+customsDuty` | ✅ |
| 「附帯税の額に相当する額を除く。」（消費税等・関税の双方） | caller が控除済みの値を入力 | `Nat.sub` 不使用 | ✅ BY-DESIGN |
| 「保税地域から引き取られる課税貨物…の課税標準は…金額とする」（条件ゼロでなく金額定義） | ゲートは式外 | `isBondedWithdrawal` を算式に入れない | ✅ BY-DESIGN |

**反例**: flag=false でも和は不変（原文は「金額」定義であり `if … then … else 0` ではない）→ 矛盾なし。零額 `(0,0,0)→0`、`(false,1,2,3)→6`、各要素 +1 → `10_500_001` も原文の加算と整合。附帯税控除をモデル側で行わないのは caller-established の境界。

**判定**: **CONFIRMED 0**（加算式・定数の食い違いなし）。BY-DESIGN 2（ゲート非反映、附帯税控除の caller 依存）、UNRESOLVED 1（関税定率法 art.4〜4の9 の価格算定自体は射程外）。境界 4/4 一致。Scope: 価格算定・附帯税算定・art.29 税率・art.28(5) 政令細目は非モデル化（明示済み）。

**H/T/D/C/U**: H「3 項の和が原文と食い違う／flag が式に入る」T「Para4 原文抽出 + 独立加算 4 点 vs `by decide`」D「RECORDED: CONFIRMED0 / BY-DESIGN2 / UNRESOLVED1」C「ゲート・控除額は caller-established で矛盾ではない（NOT_CONSTRUED as defect）」U「附帯税相当額の算定は pinned 原文のみでは検証不可」。

※ 機械的独立照合であり人間の法的レビューではない。

---

### LocalCorporationTaxRate.lean — 地方法人税法 第10条

**Pinned**: law_id `426AC0000000011`; revision `426AC0000000011_20260401_507AC0000000013`; sha256（独立計算）`263518E1…14ED2`; src `data/raw/426AC0000000011_20260401_507AC0000000013.law.json`。本文 `Article Num="10"`（第二章第二節）、1 match、Paragraph `Num="1"`/`"2"`。

**独立抽出**:
| 原文 literal | 独立計算 | Lean 定数 / 式 | 照合 |
|---|---|---|---|
| 第1項「課税標準法人税額に百分の十・三の税率を乗じて計算した金額」 | `base*103/1000`（10.3%） | `localCorpTaxRate = ⟨103,1000,…⟩`、`localCorpTax = applyFloor` | ✅ |
| 第2項「基準法人税額から当該加算された金額を控除した金額」 | `max(0, adj−add)` | `localCorpTaxBase = adjustedBase − addition`（Nat 飽和） | ✅ |
| 「加算された金額がある場合」の該当性 | Bool は caller-established | 判定 Bool を式に入れない | ✅ BY-DESIGN |
| 原文に端数規定なし（「乗じて計算した金額」のみ） | 丸めは model choice | `applyFloor`（切り捨て） | BY-DESIGN / U |

**反例**: 「百分の十・三」を `1030/1000`（10 倍過大）と誤読すれば `base=1000→1030` となるが原文は 10.3% で `103`、kernel 例も `103` → 誤読を排除。`base<addition` は 0 に飽和（`200−1000→0`、原文は「控除した金額」で負は想定外）。`999→102`、`12345→1271` の floor 境界も独立計算と一致。

**判定**: **CONFIRMED 0**（率・控除式の食い違いなし）。BY-DESIGN 3（端数 floor、該当性 Bool 非反映、額は caller-established）、UNRESOLVED 1（原文に端数規定がなく floor の法的正当性は pinned のみでは決定不能）。境界 8+6+合成 1 = 15 点一致。Scope: 基準法人税額・加算額の算定、法人税法 art.67(1)、申告納付は射程外。

**H/T/D/C/U**: H「率が 1030/1000 等と誤符号化／Bool が式に入る」T「Para1/2 原文抽出 + 独立再計算 15 点 vs `by decide`」D「RECORDED: CONFIRMED0 / BY-DESIGN3 / UNRESOLVED1」C「端数・該当性は caller-established/model choice で矛盾ではない」U「端数処理の法的正当性は人間レビュー要」。

※ 機械的独立照合であり人間の法的レビューではない。

---

### LocalIncomeTax.lean — 地方税法（道府県民税） 第34条・第35条

**Pinned**: law_id `325AC0000000226`; revision `325AC0000000226_20261101_508AC0000000002`; sha256 `3DD29E00…D53`; src `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`。本文 `Article Num="34"`/`"35"`（第二章第一節・道府県民税、9/7 matches 中 index 0）、Para1/2 を抽出。

**独立抽出**:
| 原文 literal | 独立計算 | Lean 定数 / 式 | 照合 |
|---|---|---|---|
| 34(2)「二千四百万円以下…四十三万円／…二千四百五十万円以下…二十九万円／…二千五百万円以下…十五万円」超は控除なし | 430k / 290k / 150k / 0 | `basicDeduction` | ✅ |
| 34(1)十号「九百万円以下…三十三万円（老人三十八万円）／…二十二万円（二十六万円）／…十一万円（十三万円）」千万円超なし | 330k/220k/110k/0（老人 380k/260k/130k/0） | `spouseDeduction` | ✅ |
| 35「百分の四（指定都市…百分の二）…乗じて得た金額」 | 4% / 2% | `localPrefecturalStandardRate` / `localPrefecturalIncomeTaxAmount` | ✅（floor は BY-DESIGN） |
| 34(1)二「百分の五…十万円…二百万円」 | `min(5%×所得,100k)`、控除 caps 2M | `medicalExpenseDeduction` | ✅ |
| 34(1)六号/3項「二十六万円（特別障害者三十万円）」「同居特別障害者…五十三万円」 | 260k / 300k / 530k | `disabilityDeduction` | ✅ |
| 34(1)八号・八の二・九号「二十六万円／三十万円／二十六万円」 | 260k / 300k / 260k | `widowDeduction` / `singleParentDeduction` / `workingStudentDeduction` | ✅ |
| 34(1)十一号/4項「三十三万円（特定扶養四十五万円、老人扶養三十八万円）」「同居直系尊属…四十五万円」 | 330k / 450k / 380k、上書き 450k | `dependentDeduction` / `coHabitingDirectAscendant…` | ✅ |
| 34(1)十二号「九十五万円以下…四十五万円／…六十三万円−F(x)（F=2(x−841,000) を 10万整数倍−8万へ切下げ）／…六万円／…三万円」 | 450k / 630k−F / 60k / 30k | `specificDependentDeduction` | ✅ |

**反例**: 帯域端 ±1（24M/24.5M/25M、9M/9.5M/10M）は原文の「以下」包含と一致。老人枠は `max base elderly` で常に base 以上。`9_999_999×4%→399_999`（floor）。`specDep` 950,001→510k、1,150,001→60k、1,200,001→30k も原文の分段と一致（1.23M 超は資格 caller-established）。医療費は低所得側で閾値 50k（1M 所得）→ 90k 支払で 40k。矛盾なし。

**判定**: **CONFIRMED 0**（全リテラル・分段が原文一致）。BY-DESIGN: floor（35/医療費）、年齢・老人・指定都市・特定親族の該当性 Bool、他号（雑損・配偶者特別・十号の二 等）の非反映。UNRESOLVED 1（35「乗じて得た金額」に端数規定なし、floor の法的正当性は pinned のみでは決定不能）。境界 30 点一致。Scope: 控除順序(34(11))・均等割・市町村民税・指定都市調整は非モデル化。

**H/T/D/C/U**: H「段階表リテラルまたは F(x) 式が原文と食い違う」T「Para1/2・art35 原文抽出 + 独立再計算 30 点 vs `by decide`」D「RECORDED: CONFIRMED0 / BY-DESIGN(複数) / UNRESOLVED1」C「端数・該当性は caller-established/model choice で矛盾ではない」U「端数処理の法的正当性・年齢/指定都市判定は人間レビュー要」。

※ 機械的独立照合であり人間の法的レビューではない。

---

### LocalInsuranceDeduction.lean — 地方税法（道府県民税） 第34条第1項第五号・第五号の三

**Pinned**: law_id `325AC0000000226`; revision `325AC0000000226_20261101_508AC0000000002`; sha256 `3DD29E00…D53`; src `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`。本文 `Article Num="34"` Para1（第五号／第五号の三）。

**独立抽出**:
| 原文 literal | 独立計算 | Lean 定数 / 式 | 照合 |
|---|---|---|---|
| 五号 新生命(1)「一万二千円以下…合計額／超三万二千円以下…一万二千円＋(合計−12k)/2／超五万六千円以下…二万二千円＋(合計−32k)/4／超…二万八千円」 | 12k / 12k+(p−12k)/2 / 22k+(p−32k)/4 / 28k | `newLifeInsuranceDeduction` | ✅ |
| 五号 旧生命(2)「一万五千円／四万円／七万円…一万五千円／二万七千五百円／三万五千円」（1/2, 1/4 加算） | 15k / 15k+(p−15k)/2 / 27.5k+(p−40k)/4 / 35k | `oldLifeInsuranceDeduction` | ✅ |
| 五号(3)・ハ(3)「両方…合計額が二万八千円を超える場合には二万八千円」 | `min(28k, new+old)` | `lifeInsuranceColumnI` / `lifeInsuranceColumnH` | ✅ |
| 五号 ロ 介護「一万二千円／三万二千円／五万六千円…二万八千円」（新生命と同段） | 同上（新生命と同一） | `nursingCareMedicalInsuranceDeduction` | ✅ |
| 五号 本文「イからハ…合計額（七万円超は七万円）」 | `min(70k, イ+ロ+ハ)` | `lifeInsuranceDeduction` | ✅ |
| 五号の三「地震保険料…二分の一…二万五千円超は二万五千円」 | `min(25k, p/2)` | `earthquakeInsuranceDeduction` | ✅（奇数円の /2 は floor: BY-DESIGN） |

**反例**: 段階端 12,000/32,000/56,000（新）・15,000/40,000/70,000（旧）の「以下」包含を独立計算で確認（`32k→22k`、`40k→27.5k`、`70k→35k`）。`(20k×5)→イ28k+ロ16k+ハ28k=72k→cap 70k`。地震 `49,998→24,999`、`1→0`（floor）。控除順序・保険料合計額の算定は caller-established で矛盾なし。

**判定**: **CONFIRMED 0**（全段階リテラル・上限が原文一致）。BY-DESIGN 2（偶数/奇数円の floor、各保険料合計額の caller 依存）、UNRESOLVED 1（「二分の一に相当する金額」の半端円の取扱いは pinned 原文のみでは決定不能）。境界 21 点一致。Scope: 保険契約種別の判定・剰余金控除・34(11) 順序は非モデル化。

**H/T/D/C/U**: H「段階額/上限が原文と食い違う」T「Para1 第五号/五号の三 原文抽出 + 独立再計算 21 点 vs `by decide`」D「RECORDED: CONFIRMED0 / BY-DESIGN2 / UNRESOLVED1」C「floor と caller-established 合計額は model choice で矛盾ではない」U「半端円の丸め・契約該当性は人間レビュー要」。

※ 機械的独立照合であり人間の法的レビューではない。

---

### SocialInsuranceMutualAidDeduction.lean — 地方税法（道府県民税） 第34条第1項第三号・第四号

**Pinned**: law_id `325AC0000000226`; revision `325AC0000000226_20261101_508AC0000000002`; sha256 `3DD29E00…D53`; src `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`。本文 `Article Num="34"` Para1（第三号／第四号）。

**独立抽出**:
| 原文 literal | 独立計算 | Lean 定数 / 式 | 照合 |
|---|---|---|---|
| 三号「社会保険料…を支払つた、又は給与から控除される所得割の納税義務者 その支払つた、又は給与から控除される金額」 | 入力額そのまま | `socialInsuranceDeduction = paidOrWithheld` | ✅ |
| 四号「次に掲げる掛金を支払つた…その支払つた金額の合計額」イ/ロ/ハ（小規模企業共済／企業型・個人型年金／障害者共済） | `a+b+c`（上限なし） | `smallEnterpriseMutualAidDeduction = 3 項の和` | ✅ |

**反例**: 原文に上限・段階なし。`(100k,200k,300k)→600k`、`(999_999_999×3)→2_999_999_997`、`(120k,240k,80k)→440k` はいずれも単純加算で一致。社会保険料の区分（所得税法 74(2)／租税特別措置法 41の7(2)）・政令該当性は caller-established であり、モデルが金額式に Bool を入れないのは原文（金額定義）と整合。矛盾なし。

**判定**: **CONFIRMED 0**（原文は「その金額」「合計額」のみで、Lean の恒等写像・合計と一致）。BY-DESIGN 2（社会保険料の定義・政令該当性の caller 依存、Bool 非反映）、UNRESOLVED 1（みなし社会保険料の区別は pinned 原文のみでは検証不可）。境界 4 点一致。Scope: 社会保険料の定義・34(11) 控除順序・政令適用は非モデル化。

**H/T/D/C/U**: H「控除額が原文の「その金額／合計額」と食い違う（例: 上限が付く）」T「Para1 第三号/四号 原文抽出 + 独立再計算 4 点 vs `by decide`」D「RECORDED: CONFIRMED0 / BY-DESIGN2 / UNRESOLVED1」C「区分判定は caller-established で矛盾ではない（NOT_CONSTRUED as defect）」U「みなし社会保険料の範囲は人間レビュー要」。

※ 機械的独立照合であり人間の法的レビューではない。

---

## 総括（Batch 3）

| モジュール | CONFIRMED | 境界照合 | 判定 |
|---|---|---|---|
| ConsumptionTaxImportBase | 0 | 4/4 | BY-DESIGN（ゲート・附帯税は caller-established） |
| LocalCorporationTaxRate | 0 | 15/15 | BY-DESIGN（rate 103/1000 は原文どおり、誤読排除） |
| LocalIncomeTax | 0 | 30/30 | BY-DESIGN（段階表・F(x) は原文一致） |
| LocalInsuranceDeduction | 0 | 21/21 | BY-DESIGN（段階額・上限は原文一致） |
| SocialInsuranceMutualAidDeduction | 0 | 4/4 | BY-DESIGN（恒等・合計は原文一致） |

- **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。全 79 点で独立再計算 = kernel-decided 例。
- 全 5 モジュールは pin 可能・本文定位可能であり **UNRESOLVED セクションはなし**（各セクション内の UNRESOLVED は「pinned 原文のみでは解けない法的判断」の意）。
- 一時スクリプトは削除済み。Lean / data / scripts / `docs/ADVERSARIAL_REVIEW.md` は未変更、commit / push なし。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。**
