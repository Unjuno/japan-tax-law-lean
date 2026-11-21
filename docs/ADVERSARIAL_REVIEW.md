## Batch AJ review (2026-11-21)

対象: cycle-26/27/28/29/30/31 の 6 モデル（`DutyFreeTransfer` / `SavingsDepositInterest` / `PowderSakeQuantity` / `TobaccoRate` / `StampExchangeFee` / `RemittanceReportLimit`）。coordinator 要約・STAGING を信じず、`data/raw/*.law.json` の pinned 原文から Python で直接・独立に漢数字を算数へ変換して抽出し、Lean 定数・needle・境界・公理を照合した。CI `checks()` の needle 実文字列は `scripts/ci/transcription_audit.py` から直接読み出し、自前正規化した pinned 原文に対して検証した（STAGING の记载は未使用）。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない（法的解釈・行政実務の妥当性は判定しない）。

### 1. pin 完全性（改変検知）

`data/INVENTORY.json` の `raw_snapshot.source_sha256` と実ファイルの SHA-256 を 6 件すべて再計算し一致を確認。revision id も specified どおり（下記）。pinned 原文は改変されていない。

| モデル | law_id / revision | SHA-256 一致 |
|---|---|---|
| DutyFreeTransfer | 327CO0000000125 / …_20171008_428CO0000000240 | ✅ |
| SavingsDepositInterest | 326AC1000000145 / …_20211122_503AC0000000046 | ✅ |
| PowderSakeQuantity | 337CO0000000097 / …_20250401_507CO0000000006 | ✅ |
| TobaccoRate | 359AC0000000072 / …_20260525_506AC0000000052 | ✅ |
| StampExchangeFee | 415M60000008069 / …_20191001_501M60000008047 | ✅ |
| RemittanceReportLimit | 409CO0000000363 / …_20250501_507CO0000000128 | ✅ |

### 2. 独立抽出（漢数字 → 算数）と Lean 定数照合

自作の漢数字パーサ（十/百/千/万・〇・七三の小数を Fraction で厳密処理）をセルフテストした上で、pinned 条の原文スライトから数値を抽出。桁違い（1800/180000、1万/100万、680/68020、10万/1000万 等）を厳しく確認した。

| モデル | pinned 条 | 原文数値スライト | 独立抽出値 | Lean 定数 | 境界（独立再計算） | 照合 |
|---|---|---|---|---|---|---|
| DutyFreeTransfer | art.12 | `価格が一万八千円に満たない` | 一万八千 = **18,000** | `thresholdYen = 18_000` | 17,999→true / 18,000→false / 18,001→false（厳密 `<`） | ✅ |
| SavingsDepositInterest | art.8 | `十万円をこえる` | 十万 = **100,000** | `thresholdYen = 100_000` | 99,999→false / 100,000→false / 100,001→true（厳密 `>`） | ✅ |
| PowderSakeQuantity | art.12の3 | `重量に〇・七三（一キログラム当たりのリットル数）` | 〇・七三 = **73/100** | `litersTimes100 kg = kg * 73` | kg=1→73 / 10→730 / 100→7300（liters×100=kg×73） | ✅ |
| TobaccoRate | art.11 §1 | `千本につき六千八百二円` | 六千八百二 = **6,802** | `ratePerThousandYen = 6_802` | n=1→6,802 / 2→13,604 / 10→68,020 | ✅ |
| StampExchangeFee | art.9 | `一枚につき五円` / `十円に満たない` / `一円未満の端数…切り捨て` | 五=**5**, 十=**10**, 一=**1** | `perSheetYen=5`, `smallThresholdYen=10`, `halfFloor=a/2` | amount 9→4 / 10→5 / 3枚・10→15 | ✅ |
| RemittanceReportLimit | art.8 | `政令で定める金額は、百万円とする` | 百万 = **1,000,000** | `limitYen = 1_000_000` | 999,999→true / 1,000,000→true / 1,000,001→false（`<=`） | ✅ |

- 漢数字パーサ開啟値: 一万八千→18000、十万→100000、六千八百二→6802、五→5、十→10、百万→1000000、一→1、〇・七三→73/100（全件期待値どおり）。
- 全 6 モデルの条 flat text 長は 176 / 158 / 83 / 151 / 179 / 140 文字で、各モデル doc-comment の申告値と完全一致（U+3000 は 0 件）。

**桁違いチェック結果: 不一致ゼロ。** 一万八千=18,000（18,000 でなく 1,800/180,000 ではない）、十万=100,000（1万/100万ではない）、六千八百二=6,802（680/68,020 ではない）、百万=1,000,000（10万/1000万ではない）を原文から直接確認。

### 3. needle 健全性（CI `checks()` 実文字列を自前正規化原文で検証）

正規化は CI と同一の `re.sub(r"[\s　]+", "", s)`（U+3000 を含む全空白を除去）を needle と pinned 原文の双方に適用し、部分文字列包含を判定（file locator、CI と同一）。各モデル 2 本、計 12 本。

| モデル | needle 数 | U+3000 含有 | FOUND（自前正規化原文） |
|---|---|---|---|
| DutyFreeTransfer | 2 | 0 / 0 | 2/2 ✅ |
| SavingsDepositInterest | 2 | 0 / 0 | 2/2 ✅ |
| PowderSakeQuantity | 2 | 0 / 0 | 2/2 ✅ |
| TobaccoRate | 2 | 0 / 0 | 2/2 ✅ |
| StampExchangeFee | 2 | 0 / 0 | 2/2 ✅ |
| RemittanceReportLimit | 2 | 0 / 0 | 2/2 ✅ |

- **12/12 FOUND、U+3000 含有 0 件、needle 健全性に問題なし。**
- 補足: RemittanceReportLimit は同一法令内に `Num=8` が 2 件あるが、needle は本則 art.8（百万円、140 文字）に固有（`第八条法第四条第一項に規定する政令で定める金額は、百万円とする`）で、正しい条文を指している。

### 4. 反例探索（境界値＋グリッド走査）

| モデル | 境界 | グリッド走査 | 反例 |
|---|---|---|---|
| DutyFree | 17,999=true / 18,000=false / 18,001=false | p=0..20,000 全点で `p<18000` と一致 | 0 |
| Savings | 99,999=false / 100,000=false / 100,001=true | a=0..200,000 全点で `a>100000` と一致 | 0 |
| PowderSake | 0→0 / 1→73 / 10→730 / 100→7300 | kg=0..5,000 全点で `kg*73` と一致 | 0 |
| Tobacco | n=0→0 / 1→6,802 / 2→13,604 / 10→68,020 / 100→680,200 | n=0..1,000 全点で `6802*n` と一致 | 0 |
| Stamp | (s=1) 8→4 / 9→4 / 10→5 / 11→5、(s=3,a=10)→15 | s=0..5 × a=0..50 全点で `a<10 ? a/2 : 5*s` と一致 | 0 |
| Remittance | 999,999=true / 1,000,000=true / 1,000,001=false | a=999,990..1,000,009 全点で `a<=1000000` と一致 | 0 |

**反例検出数: ゼロ。**

### 5. NOT MODELLED（BY-DESIGN）の明記確認

6 モデルすべてに `Scope / NOT MODELLED` 節があり、各境界の射程外が明記されている。特筆点:

- **TobaccoRate**: 原文 art.11 は §1（6,802 円/千本）に加え §2 に特例 14,424 円/千本（`一万四千四百二十四円`）を含むが、モデルは §1 のみを扱い §2 を明示的に NOT MODELLED としている → **BY-DESIGN**（転記漏れではない）。
- DutyFree: 使用・贈与の認定、許可手続、法11条1項の譲渡定義、免税物品の範囲 → NOT MODELLED（`満たない` は厳密 `<` と境界検証済み）。
- Savings: 指定金融機関委託の例外、政令期間、引出し日期間の対応 → NOT MODELLED。
- PowderSake: リットル数の端数処理（原文に明示なし）、重量測定・法7条6項定義 → NOT MODELLED。
- Stamp: 交換請求の具体認定、2枚以上の合計額算定手続、「半額」切捨ての法的解釈（未確定）→ NOT MODELLED。
- Remittance: §2 外国通貨換算、国外送金等の定義、調書提出手続、法4条1項の他要件 → NOT MODELLED。

### 6. 公理監査

- `lake env lean` で 6 モジュールを import し、11 個の named def/threshold/関数に加え、`by decide` で再構成した 10 個の境界定理（計 21 件）へ `#print axioms` を実行。**21/21 が "does not depend on any axioms"**（`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存 = 0）。
- 6 モデル＋Spec＋Tests の静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。全証明は `by decide` のカーネル還元証明。

### 7. 分類・件数

- **CONFIRMED（数値・境界・needle・公理）= 0 件**。発見（意味的）= **ゼロ**。
- **BY-DESIGN = 6 件**（上記 NOT MODELLED の各モデル明示スコープ。TobaccoRate §2 の 14,424 円を含む）。
- **UNRESOLVED = 2 件**（いずれも pinned 原文のみでは解けず人間の法律専門家判断を要する: (1) StampExchangeFee の「半額」一円未満切捨ての法的妥当性（モデル内でも「法的解釈は未確定」と明記）、(2) PowderSakeQuantity のリットル数端数処理の有無。数値・算術の一致には影響しない）。
- **CONFIRMED（ドキュメント表記のみ・非意味的）= 1 件**: 5 モデル（SavingsDepositInterest / PowderSakeQuantity / TobaccoRate / StampExchangeFee / RemittanceReportLimit）の header `Raw snapshot:` が `data/raw/data/raw/…` と二重になっており、実在する正規パスは `data/raw/…`（DutyFreeTransfer は正しい単一パス）。law_id・revision・文字数・needle・定数はすべて正しく、計算・証明・pin 完全性への影響なし。修正は Lean モジュール側のため本レビューでは変更せず報告のみ。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。解析用一時ファイルはすべて削除済み。Lean モジュール / `data/*.json` / `scripts/*.py` は読み取り専用で一切変更せず、commit / push / merge / ブランチ切替は行っていない。
