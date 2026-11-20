# Adversarial Review — Batch 9（機械的独立クロスチェック）

- 2026-11-21 / adversarial review agent。対象 3 モジュールは読み取り専用でレビュー（既存の `by decide` 例に境界例を追加したのは各 `*-Tests.lean` のみ）。Lean / data / scripts / 他 docs は未変更、未 commit/push。
- 手法: 自前 Python で pinned raw JSON を直接 read し、`law_full_text` を再帰 flatten して `Article` の `attr.Num` で locate（U+3000/空白は `re.sub(r"[\s　]+","",...)` で正規化）。doc-comment / `transcription_audit.py` は信じず raw から独立抽出。SHA-256 は hashlib の full-read と chunked-read で独立再計算（両者一致）。`lake`/`lean` は PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_9` に置き、完了後に削除。**本レビューは機械的独立クロスチェックであり、人間の法律専門家レビューではない。**

### CustomsSmallConsignment.lean — 関税定率法 第三条の三（少額輸入貨物に対する簡易税率）

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01、amend `508AC0000000005`）; `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`（9,407,678 bytes）SHA-256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`（full/chunked 独立一致、doc-comment と一致）。自前 flatten で `Article attr.Num="3_3"` を 2 件検出 → 内 1 件 `law_full_text/children/1/children/1/children/4`（caption「（少額輸入貨物に対する簡易税率）」、699 文字）を **LOCATED**; 他 1 件 `…/children/25/children/2/children/6` は別表の免税貨物（博覧会カタログ等）の Item で無関係。
- **独立抽出**: 当該 Article の leaf を連結・正規化した文字列に対し、自前 needle を `.count()` で検証（すべて **1 回**）: 「の合計額が二十万円以下の輸入貨物」/「本邦に入国する者がその入国の際に携帯して輸入し、又は前条第一項の政令で定めるところにより別送して輸入する貨物を除く」/「が当該輸入貨物の全部について同表によることを希望しない旨を税関に申し出たときは、この限りでない」/「前項の規定は、前条第二項第一号及び第二号に掲げる貨物…政令で定める貨物には適用しない」/「二十万円以下」。

  | 原文リテラル | 独立計算 | Lean 定数 / 式 | 照合 |
  |---|---|---|---|
  | 「合計額が二十万円以下」（日本語数字、原文に Arial 数字なし） | 閾値 = 200,000、「以下」= inclusive → `≤` | `smallConsignmentThreshold = 200_000`; `decide (totalPrice ≤ smallConsignmentThreshold)` | ✅ |
  | 「(input 携帯)…別送して輸入する貨物を除く」(1項) | 除外法的判断 → caller-established Bool | `excluded : Bool`（`!excluded`） | ✅ BY-DESIGN |
  | 「前条第二項第一号及び第二号に掲げる貨物…政令で定める貨物には適用しない」(2項) | 同上の除外に統合 | `excluded : Bool` | ✅ BY-DESIGN |
  | 「希望しない旨を税関に申し出たときは、この限りでない」(1項但書) | 申出の法的判断 → caller-established Bool | `optedOut : Bool`（`!optedOut`） | ✅ BY-DESIGN |
  | 「関税の率は…別表の付表第二による」 | **税率表そのものは非モデル化**（適用可否のみ） | `smallConsignmentApplies` は Bool gate | ✅ BY-DESIGN |
  | 「次条から第四条の九までの規定により算出される…価格の合計額」 | 課税標準価格の算定は別スライス | `totalPrice : Money` を入力として受け取る | ✅ BY-DESIGN |
- **反例（独立再計算 ≥3）**: 原文由来の式 `applies(p,e,o) = (p ≤ 200000) and not e and not o` を自前 Python で再計算し、 impl / Spec / Tests の全 `by decide` 期待値と照合 → **全一致、矛盾 0**。境界: `(0,false,false)→true`（零入力）; `(1,false,false)→true` / `(13,false,false)→true`（1..13 の小さい正の入力、今回追加分）; `(199999,false,false)→true`; `(200000,false,false)→true`（「以下」inclusive の等号境界）; `(200001,false,false)→false`（超過 = saturation）; `(100000,true,false)→false` / `(100000,false,true)→false` / `(100000,true,true)→false`。等号 200,000 を true とするのは原文「以下」通りで `<` ではない。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN: ①税率表（付表第二）は適用可否 gate の射程外、②除外該当性（携帯/別送・2項号・政令貨物）・申出は法的判断で caller-established、③課税標準価格の合算は art.4〜4の9 側の caller-established Money、④Bool `false` を「result 0」と読む saturation は model choice であり矛盾ではない。**LOCATED / UNRESOLVED なし**。
- **H/T/D/C/U**: H=閾値「二十万円」を誤った数値/`<` で符号化する、又 除外・但書が式に混入する; T=Num=3_3 locate + 5 needle 各1回 + 9 境界独立再計算⇔全 `by decide`（全一致）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4, LOCATED）; C=「二十万円以下」を `<` と読む解釈は日本語「以下」＝ inclusive で排斥、税率表・除外判定は caller-established で矛盾ではない; U=付表第二の実際の税率・政令で定める貨物の具体範囲・課税標準価格の算定は caller-established／要専門家。

### CustomsValueAfterDamage.lean — 関税定率法 第四条の五（変質又は損傷に係る輸入貨物の課税価格の決定）

- **pinned ids**: law_id `143AC0000000054` / rev `143AC0000000054_20260601_508AC0000000005`（施行 2026-06-01、amend `508AC0000000005`）; 上と同じ `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`（9,407,678 bytes）SHA-256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`（full/chunked 独立一致）。自前 flatten で `Article attr.Num="4_5"` を 1 件検出 → `law_full_text/children/1/children/1/children/9`（378 文字）を **LOCATED**（caption「（変質又は損傷に係る輸入貨物の課税価格の決定）」）。
- **独立抽出**: 当該 Article の正規化文字列に対し自前 needle を `.count()`（すべて **1 回**）: 「第四条から前条までの規定により課税価格を計算する場合において」/「までに当該輸入貨物に変質又は損傷があつたと認められるときは」/「当該変質又は損傷がなかつたものとした場合に計算される課税価格からその変質又は損傷があつたことによる減価に相当する額を控除して得られる価格とする」。原文に数値トークン（円/％/Arabic）なし。

  | 原文リテラル | 独立計算 | Lean 定数 / 式 | 照合 |
  |---|---|---|---|
  | 「…課税価格から…減価に相当する額を控除して得られる価格とする」 | 課税価格 = 仮想 − 減価 | `customsValueAfterDamage h d = h - d`（Money=Nat） | ✅ |
  | 「変質又は損傷がなかつたものとした場合に計算される課税価格」 | art.4〜4の4 の算定は別スライス、入力 | `hypothetical : Money` を入力として受け取る | ✅ BY-DESIGN |
  | 「減価に相当する額」 | 減価算定方法は条文に数式なし（政令・通達依存） | `depreciation : Money` を入力として受け取る | ✅ BY-DESIGN |
  | 「輸入申告の時までに…変質又は損傷があつたと認められるときは」 | 法的判断（Bool）— 条文は金額定義で条件付きゼロではない | Bool を式に入れず caller-established | ✅ BY-DESIGN |
  | （原文に記載なし）減価 > 仮想のアンダーフロー | 法令上想定外、Nat saturating → 0 | `h - d` の saturating 減算、doc-comment に明示 | ✅ BY-DESIGN |
- **反例（独立再計算 ≥3）**: 原文由来の式 `damage(h,d) = max(h-d, 0)` を自前 Python で再計算し impl / Spec / Tests の全 `by decide` 期待値と照合 → **全一致、矛盾 0**。境界: `damage(100000,20000)=80000`; `damage(500000,150000)=350000`; `damage(100000,0)=100000`（減価 0 = identity、入力と一致）; `damage(100000,100000)=0`（同額 → 0）; `damage(10000,20000)=0`（underflow saturation）; `damage(0,5000)=0`（零入力）; 今回追加の小さい正の入力 `damage(13,5)=8` / `damage(13,0)=13`（identity）/ `damage(5,13)=0`（saturation）。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN: ①仮想課税価格・減価額・変質損傷該当性は caller-established、②underflow の 0 は Nat saturating の model choice で「課税価格ゼロ」を主張するものではない（doc-comment に明記）、③art.4〜4の4 の課税価格計算は別スライス。**LOCATED / UNRESOLVED なし**。
- **H/T/D/C/U**: H=減算を通常減算/条件付きゼロ等と誤符号化する、又 減価・仮想価格に原文なき上限が入る; T=Num=4_5 locate + 3 needle 各1回 + 原文数値トークン0 + 10 境界独立再計算⇔全 `by decide`（全一致）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 3, LOCATED）; C=「減価 > 仮想」で負を返す解釈は Nat モデルで排斥、0 を還付と読む解釈は doc-comment のスコープ注記で排斥; U=減価額の政令・通達上の算定、変質損傷該当性の法的判断、art.4〜4の4 側の価格算定は caller-established／要専門家。

### IncomeBasicDeduction.lean — 所得税法 第八十六条（基礎控除）

- **pinned ids**: law_id `340AC0000000033` / rev `340AC0000000033_20261001_507AC0000000070`（施行 2026-10-01、amend `507AC0000000070`）; `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`（16,405,085 bytes）SHA-256 `94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b`（full/chunked 独立一致、doc-comment と一致）。自前 flatten で `Article attr.Num="86"` を 1 件検出 → `law_full_text/children/1/children/3/children/1/children/2/children/4/children/17`（647 文字）を **LOCATED**（caption「（基礎控除）」）。
- **独立抽出**: 当該 Article の leaf は `ItemSentence` が `Column1Sentence1` / `Column2Sentence1` に分割されているため、doc-comment の連結 needle を raw 全体で逐語に探すのではなく、各 leaf を直接抽出して照合（自前 needle は当該 Article 正規化文字列ですべて **1 回**）: 本文「合計所得金額が二千五百万円以下である居住者については…控除する。」/ 一号 Column1「二千三百五十万円以下である場合」+ Column2「五十八万円」/ 二号「二千三百五十万円を超え二千四百万円以下である場合」+「四十八万円」/ 三号「二千四百万円を超え二千四百五十万円以下である場合」+「三十二万円」/ 四号「二千四百五十万円を超え二千五百万円以下である場合」+「十六万円」/ 2項「前項の規定による控除は、基礎控除という。」。（raw JSON の Column タグにより連結形は逐語一致しないが、これは構造上の違いのみで実質金額・境界は下記のとおり完全一致。）

  | 原文リテラル | 独立計算 | Lean 定数 / 式 | 照合 |
  |---|---|---|---|
  | 本文「合計所得金額が二千五百万円以下である居住者については…控除する」 | 第1項は ≤25,000,000 にのみ適用、超過は 0 | `basicDeductionAmount` の最終 `else 0` | ✅ |
  | 一号「二千三百五十万円以下である場合五十八万円」 | ≤23,500,000 → 580,000 | `basicDeductionLe2350 = 580_000`; 第1分岐 | ✅ |
  | 二号「二千三百五十万円を超え二千四百万円以下…四十八万円」 | 23,500,001..24,000,000 → 480,000 | `basicDeductionLe2400 = 480_000`; 第2分岐 | ✅ |
  | 三号「二千四百万円を超え二千四百五十万円以下…三十二万円」 | 24,000,001..24,500,000 → 320,000 | `basicDeductionLe2450 = 320_000`; 第3分岐 | ✅ |
  | 四号「二千四百五十万円を超え二千五百万円以下…十六万円」 | 24,500,001..25,000,000 → 160,000 | `basicDeductionLe2500 = 160_000`; 第4分岐 | ✅ |
  | 「…から…金額を控除する」 | 控除後 = 所得 − 控除額、ゼロ下限 | `taxableAfterBasicDeduction i d = i - d`（saturating Nat） | ✅ |
  | 「居住者については」「合計所得金額の算定」 | 該当性・算定は caller-established | Bool を式に入れず `totalIncome : Money` 入力 | ✅ BY-DESIGN |
  | 税額計算・控除順序・端数処理（通則法 118/119） | 非モデル化 | モデル外（doc-comment に明記） | ✅ BY-DESIGN |
- **反例（独立再計算 ≥3）**: 原文由来の区分式 `deduct(t)` と saturating 減算 `taxable(i,d)=max(i-d,0)` を自前 Python で再計算し、 impl / Spec / Tests の全 `by decide` 期待値と照合 → **全一致、矛盾 0**。全境界: `deduct(0)=580000`; `deduct(23500000)=580000`; `deduct(23500001)=480000`; `deduct(24000000)=480000`; `deduct(24000001)=320000`; `deduct(24500000)=320000`; `deduct(24500001)=160000`; `deduct(25000000)=160000`; `deduct(25000001)=0`（第1項適用外 = result 0）; `deduct(99999999)=0`。控除後: `taxable(1000000,580000)=420000`; `taxable(580000,580000)=0`; `taxable(100000,580000)=0`; `taxable(0,0)=0`; `taxable(24000000,deduct(24000000))=23520000`; 今回追加の小さい正の入力 `deduct(1)=580000` / `deduct(13)=580000` / `taxable(13,0)=13`（identity、入力と一致）/ `taxable(5,13)=0`（saturation）。境界の「以下/超え」は全て inclusive/exclusive を正しく反映（23,500,000→580,000 と 23,500,001→480,000 の不連続点を含む）。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN: ①居住者性・合計所得金額の算定は caller-established、②untaxed 超過（25,000,001 以上）の 0 は第1項適用外の model choice、③underflow の 0 は Nat saturating の選択、④税額計算・控除順序・端数処理は非モデル化。いずれもモジュールがスコープとして明記しており矛盾ではない（NOT_CONSTRUED as defect）。**LOCATED / UNRESOLVED なし**。
- **H/T/D/C/U**: H=四区分の金額/境界（二千三百五十万/二千四百万/二千四百五十万/二千五百万・五十八万/四十八万/三十二万/十六万）が Lean と食い違う; T=Num=86 locate + 10 needle 各1回 + 全境界 9 点 + 控除後 5 点 + 追加 4 点の独立再計算⇔全 `by decide`（全一致）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4, LOCATED）; C=「二千五百万円超」を第4区分の延長と読む解釈は本文「二千五百万円以下である居住者については」で排斥、Column 分割を金額の相違と読む解釈は leaf 抽出で排斥; U=居住者判定・合計所得金額の算定・控除適用順序・端数処理の法的取扱いは caller-established／要専門家。

---

- **総括（Batch 9）**: 3 モジュールすべて **CONFIRMED 0 / UNRESOLVED 0**、原文と Lean の実食い違いは検出されなかった。全判定は原文由来の式を独立再計算した機械的クロスチェックに基づき、**人間の法律レビューではない**。一時 Python スクリプトは `D:\CodexData\Temp\advrev_9` に置き、完了後に削除済み。
