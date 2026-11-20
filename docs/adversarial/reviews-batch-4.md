# Adversarial Review — Batch 4（機械的独立照合）

- 日付: 2026-11-21 / 役割: 形式化担当から独立した adversarial review agent。
- 対象 5 モジュールは**読み取り専用**（Lean / data / scripts / `docs/ADVERSARIAL_REVIEW.md` は未変更）。
- 手法: 各 `.law.json` を自前 Python で再帰 flatten し、`Article` の `Num` 属性で条文を locate（U+3000/空白を正規化）。Lean doc-comment / `transcription_audit.py` / STAGING は信じず、pinned 原文からリテラルと式を独立抽出。独立 Python 再計算値を `.lean` / `-Spec.lean` / `-Tests.lean` の `by decide` 例と照合。一時スクリプトは `D:\CodexData\Temp` に置き削除済み。SHA-256 は独立再計算。
- **本レビューは機械的独立クロスチェックであり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。発見ゼロ（CONFIRMED=0）の場合も明記する。
- 注: 本環境では `lake`/`lean` が PATH になく、カーネル再実行は未実施。`by decide` 例はソース記載の期待値と独立計算を照合した（各例は `by decide` により構成上カーネル判定される）。

### LowAlcoholDutySpecialRate.lean — 租税特別措置法 第八十七条の二

- **pinned ids**: law_id `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`（施行 2026-11-01）; `data/raw/332AC0000000026_20261101_507AC0000000013.law.json` SHA-256 `E6E6013B…5EE`（一致）。`Article Num="87_2"` path `(1,3,6,2,2)`（357 文字）→ **LOCATED**。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「一 アルコール分が十一度未満のもの 十万円」 | a<11 → ¥100,000 | `some 100_000` | ✅ |
  | 「二 十一度以上十三度未満 … 十万円に十度を超える一度ごとに一万円を加えた金額」 | 11≤a<13 → 100,000+(a−10)×10,000 | `some (100_000+(a−10)*10_000)` | ✅ |
  | 「十三度未満（リキュールは十二度未満）」 | distilled a<13 / liqueur a<12、逸脱 `none` | `<13` / `<12` else `none` | ✅ |
  | 「一キロリットルにつき」 | kL 単価（数量掛けなし） | 度数→単価関数のみ | ✅ BY-DESIGN |
- **反例**: distilled 10→100000 / 11→110000 / 12→120000 / 13→`none`、liqueur 11→110000 / 12→`none` を独立計算し `.lean`/.Tests/.Spec の全 `by decide` 例と一致。a=10 は号一、a=11 は号二の加算起点（a−10=1）で連続。矛盾 0。
- **判定**: CONFIRMED 0。BY-DESIGN: ①附則第九十一条の読替え（令和2-10-01〜令和8-09-30 の 九度/八万円/八度）は非モデル化 — pin 施行 2026-11-01 は期間後で本則が現行、正しいスコープ; ②度数は整数 Nat、蒸留/リキュール判別は caller-established; ③酒税法第23条一般税率は射程外。U: 小数度数（実務の酒精濃度）の取扱いは caller-established。
- **H/T/D/C/U**: H=号一/号二の金額・境界が Lean と食い違う; T=10/11/12/13 とカテゴリ別 12/13 の独立再計算⇔`by decide`; D=NOT_CONFIRMED（不一致 0, BY-DESIGN 3）; C=附則読替え適用説は pin 施行日で排斥; U=小数度数・該当性は caller-established。
- **限定**: 機械的照合のみ。人間の法律レビューではない。

### ResidentialTransferSpecialTax.lean — 租税特別措置法 第三十一条の三

- **pinned ids**: law_id `332AC0000000026` / rev `…_20261101_507AC0000000013`（上の LowAlcohol と同一 pin、SHA-256 一致）。`Article Num="31_3"` path `(1,3,1,4,2,3)`（1207 文字）→ **LOCATED**。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「一 課税長期譲渡所得金額が六千万円以下 … 百分の十」 | gain×10/100 | `lowResidentialRate = ⟨10,100⟩`, `residentialBoundary = 60_000_000` | ✅ |
  | 「二 …六千万円を超える … イ 六百万円 ロ …六千万円を控除した金額の百分の十五」 | 6,000,000+(gain−60,000,000)×15/100 | `6_000_000 + applyFloor excessResidentialRate (gain−60_000_000)` | ✅ |
  | 柱書「所有期間が十年を超える」「居住用財産」「配偶者等除外」「前年/前々年非適用」 | 4 Bool gate（ externally established ） | `residentialTransferEligible` | ✅ BY-DESIGN |
  | 非適格時（Validator: art.31 一般税率） | gain×15/100 | `longTermGainRate = ⟨15,100⟩` fallback | ✅ BY-DESIGN |
- **反例**: 0→0 / 30M→3M / 60M→6M / 60,000,001→6M（連続）/ 60,000,100→6,000,015 / 100M→12M / 200M→27M を独立計算し全 `by decide` 例と一致。境界 60M は「以下」で特例側、1 円超は控除額 0 で連続。非適格 4 パターンも 15% fallback と一致。矛盾 0。
- **判定**: CONFIRMED 0。BY-DESIGN: ①適格 4 条件は caller-established Bool、②art.31の3(2)定義・(3)申告/取得費加算は非モデル化、③非適格時 art.31(1) 15% fallback、④端数は `applyFloor`(=m×num/den) — 原文に端数規定なし。U: 千円未満端数の法的取扱いは pinned 条文のみでは決定不能。
- **H/T/D/C/U**: H=10%/15%・6000万円の壁が Lean と食い違う; T=0/30M/60M/60M+1/60M+100/100M/200M の独立計算⇔`by decide`; D=NOT_CONFIRMED（不一致 0, BY-DESIGN 4）; C=60M 超限を不連続と読む解釈は「控除した金額」で排斥; U=端数処理・適格認定は caller-established/要専門家。
- **限定**: 機械的照合のみ。人間の法律レビューではない。

### SpecialMeasuresCasinoRatio.lean — 租税特別措置法施行令 第四十六条の四

- **pinned ids**: law_id `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`（施行 2026-11-01）; `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`（SHA-256 `D0AD21A8…94D`、doc-comment に hash 記載なし）。`Article Num="46_4"` path `(1,3,6,9)`（252 文字 = doc-comment の文字数と一致）→ **LOCATED**。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「資産の譲渡等…の対価の額…の合計額に…カジノ業務収入の合計額を加算した金額」 | 分母 = totalConsideration + casinoIncome | `casinoCombinedTotal = t + c` | ✅ |
  | 「当該カジノ業務収入の合計額の占める割合が百分の五を超えない」 | c/(t+c) ≤ 5/100 ⟺ c×100 ≤ 5×(t+c) | `decide (c*100 ≤ 5*(t+c))` | ✅ |
  | 「超えない」（`≤`、` <` ではない） | ちょうど 5% → true | `≤` を採用 | ✅ |
- **反例**: (95,5)=5.0%→true / (94,6)≈6.0%→false / (285,15)=5.0%→true / (284,16)≈5.3%→false / (0,0)→true（退化）/ (9,500,000,500,000)→true / (9,499,999,500,001)→false を独立計算し全 `by decide` 例と一致。交差掛けで除算ゼロなし。矛盾 0。
- **判定**: CONFIRMED 0。BY-DESIGN: ①「百分の五を超えない」算術のみモデル化、課税期間・該当性・他の政令要件は caller-established、②分母零 (0/0→true) は停止するが法的意味は主張せず入力妥当性は caller 責任。doc-comment の needle 引用は「（消費税法第二条第一項第八号…）」括弧を省略し「…加算した金額のうちに」を重複させるが原文逐語ではなく fidelity-only、式に影響なし。U: 0/0 退化ケースの法的扱い。
- **H/T/D/C/U**: H=5% 判定式・分母構成が Lean と食い違う; T=5% 境界 4 点+零分母+大規模点の独立計算⇔`by decide`; D=NOT_CONFIRMED（不一致 0, BY-DESIGN 2）; C=「超える」を `<` と読む解釈は原文「超えない」で排斥; U=退化ケース・他政令要件は caller-established。
- **限定**: 機械的照合のみ。人間の法律レビューではない。

### SpouseSpecialDeduction.lean — 地方税法 第三十四条第一項第十号の二

- **pinned ids**: law_id `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`（施行 2026-11-01）; `data/raw/325AC0000000226_20261101_508AC0000000002.law.json` SHA-256 `3DD29E00…8D53`（一致）。`Article Num="34"` path `(1,2,1,1,2,1,3)` 内の「十の二」条文 → **LOCATED**（原文ラベルは「十の二」、号は親見出しの「十」に属する; doc-comment の「十号の二」は表記差で非実質）。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「（１）百万円以下 … 三十三万円」 | s≤1,000,000 → 330,000 | `spouseSpecialDeductionBase` | ✅ |
  | 「（２）百万円超百三十万円以下 … 三十八万円から…九十三万一円を超える部分…（五万円の整数倍から三万円を控除した金額で…満たないもののうち最も多い金額）を控除」 | 380,000−taper(s−931,000), k=⌊(e+30,000)/50,000⌋ | `taperFrom931k` / base | ✅ |
  | 「（３）百三十万円を超える配偶者 三万円」／「百三十三万円以下」cap | 30,000 / s>1,330,000 → 0 | base / `spouseSpecialDeduction` | ✅ |
  | 「ロ 九百万円超九百五十万円以下 … 三分の二」「ハ …三分の一」「一万円未満の端数切上げ」 | base×2/3 又 base/3 → roundUp¥10,000 | `roundUpToTenThousand` | ✅ |
  | 「千万円以下」「九百万円以下」tp 帯 | tp≤9M→base / ≤9.5M→2/3 / ≤10M→1/3 / 超→0 | 分岐と同値 | ✅ |
- **反例**: taper e=19,999→0 / 20,000→20,000 / 69,001→20,000 / 119,000→70,000; spouse 1,000,001→360,000 / 1,050,000→310,000 / 1,100,000→260,000 / 1,300,000→60,000 / 1,300,001→30,000 / 1,330,001→0; roundUp 90,001→100,000 / 253,333→260,000; tp=10,000,001→0 を独立計算し全 `by decide` 例と一致。矛盾 0。
- **判定**: CONFIRMED 0。BY-DESIGN: ①「控除対象配偶者に該当しない」blocker・青色事業専従者除外・双方向適用除外は caller-established Bool（`isNotQualifyingSpouse`/`ineligibleByStatute`）、②art.34(1)第十一号（控除順序）は非モデル化、③納税義務者 1,000 万円超の除外はモデル内で checkable（doc-comment どおり）。U: 端数切り上げを「積の floor 後に roundUp」とする手順は原文文言と整合するが厳密な法解釈は要専門家。
- **H/T/D/C/U**: H=taper 式・帯・端数が Lean と食い違う; T=taper 5 点+配偶者帯 6 点+roundUp+tp cap の独立計算⇔`by decide`; D=NOT_CONFIRMED（不一致 0, BY-DESIGN 3）; C=「最も多い金額」を k×50,000−30,000 の ceiling と読む解釈は「満たないもの」で排斥; U=一部 blocker・端数手順は caller/要専門家。
- **限定**: 機械的照合のみ。人間の法律レビューではない。

### StampDutySpecial91.lean — 租税特別措置法 第九十一条 / 印紙税法 別表第一 第一号・第二号

- **pinned ids**: ①租特法 law_id `332AC0000000026` / rev `…_20261101_507AC0000000013`（SHA-256 `E6E6013B…5EE`）`Article Num="91"` path `(1,3,6,9,1)`（1281 文字）→ **LOCATED**; ②印紙税法 law_id `342AC0000000023` / rev `342AC0000000023_20261001_507AC0000000070`（施行 2026-10-01, SHA-256 `263FCDCB…02F` 一致）別表第一 `Table` path `(1,249,8,1)` → **LOCATED**。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | (1) 十万円超五十万円以下 二百円 / …百万円以下 五百円 / …五百万円以下 千円 / …千万円以下 五千円 | 100,001→200 / 500,001→500 / 1,000,001→1,000 / 5,000,001→5,000 | `special91Item1` | ✅ |
  | (1) 千万円超五千万円以下 一万円 / …一億円以下 三万円 / …五億円以下 六万円 / …十億円以下 十六万円 / …五十億円以下 三十二万円 / 五十億円超 四十八万円 | 10M+→10,000 / 50M+→30,000 / 100M+→60,000 / 500M+→160,000 / 1B+→320,000 / 5B+→480,000 | `special91Item1` | ✅ |
  | (2) 百万円超二百万円以下 二百円 / 二百万円超三百万円以下 五百円 / 三百万円超五百万円以下 千円 / 五百万円超千万円以下 五千円（以降 (1) と同帯） | 1,000,001→200 / 2,000,001→500 / 3,000,001→1,000 / 5,000,001→5,000 | `special91Item2` | ✅ |
  | 別表第一一号一般: 十万円以下 二百円 / …五十万円以下 四百円 / …百万円以下 千円 / …五百万円以下 二千円 …五十億円超 六十万円 | 2M→2,000 / 60M→60,000 / 600M→200,000 | `contractStampDuty` (StampTable) | ✅ |
  | 別表第一第二号一般: 百万円以下 二百円 / …二百万円以下 四百円 …五十億円超 六十万円 | 2M→400 / 60M→60,000 / 600M→200,000 | `workContractStampDuty` (StampTable) | ✅ |
- **反例**: item1 100,000→0（柱書下限外）/ 100,001→200 / 5,000,000,001→480,000; item2 1,000,000→0 / 1,000,001→200 / 6,000,000→5,000; 一般表との支配関係を全帯境界で独立確認し `.lean`/Tests/Spec の `by decide` 例と一致。矛盾 0。original の号五「千万円超五千万円以下 一万円」は flatten 上の連結に見えるが号境界を正しく parse（五千円+「五」+千万円…）。
- **判定**: CONFIRMED 0。BY-DESIGN: ①文書種別・契約金額ゲート・作成期間は caller-established Bool、②art.91(3) の通則3イ読替え（十万円→五十万円、百万円→二百万円）は非モデル化、③一般表の整合は doc-comment が「手読のみ」と申告するが本レビューで raw table と独立一致を確認、④金額記載なし文書は柱書対象外。U: 通則3イ読替えの非課税下限への法的効果は caller 判断。
- **H/T/D/C/U**: H=特例 2 表・一般表の帯が Lean と食い違う; T=item1/item2 全帯境界+一般表 3 点+支配関係の独立計算⇔`by decide`; D=NOT_CONFIRMED（不一致 0, BY-DESIGN 4）; C=号五を「五千万円超五千万円以下」と読む解釈は flatten 連結の誤読で排斥; U=art.91(3)/期間計算・文書該当性は caller-established。
- **限定**: 機械的照合のみ。人間の法律レビューではない。StampTable 自体はレビュー対象外だが支配関係の前提として raw と照合した。

---

## 総括（Batch 4）

| モジュール | 一行判定 |
|---|---|
| LowAlcoholDutySpecialRate.lean | LOCATED / CONFIRMED 0 — 号一・号二の ¥100,000/¥10,000 境界は原文一致、附則読替えは期間外で非モデル化が正しい（BY-DESIGN 3, U 1）。 |
| ResidentialTransferSpecialTax.lean | LOCATED / CONFIRMED 0 — 10%/15%・6000万円の壁・連続性は原文一致、適格ゲートと端数は caller/モデル選択（BY-DESIGN 4, U 1）。 |
| SpecialMeasuresCasinoRatio.lean | LOCATED / CONFIRMED 0 — 分母 t+c と「百分の五を超えない」(≤) 判定は原文一致、零分母は退化扱い（BY-DESIGN 2, U 1）。 |
| SpouseSpecialDeduction.lean | LOCATED / CONFIRMED 0 — taper(base)・2/3/1/3・切上げ・各所得帯は原文一致、blocker は caller-established（BY-DESIGN 3, U 1）。 |
| StampDutySpecial91.lean | LOCATED / CONFIRMED 0 — 特例 2 表の全帯と一般表（raw 独立確認）は一致、art.91(3) は非モデル化（BY-DESIGN 4, U 1）。 |

- **CONFIRMED（原文と Lean の実食い違い）= 0 件（全 5 モジュール）**。BY-DESIGN 合計 16、U（残る不確実性）合計 5。UNRESOLVED（pin/条文が locate できない）= 0。
- 全 4 pinned raw ファイルの SHA-256 を独立再計算し、記載のある 3 つは doc-comment と一致（casino は doc-comment に hash 記載なし）。
- 一時 Python スクリプトは `D:\CodexData\Temp` に作成し削除済み。git status クリーン（本ファイル以外の書込なし、コミット/プッシュなし）。
- 本レビューは機械的独立クロスチェックであり、人間の法的レビューを称するものではない。
