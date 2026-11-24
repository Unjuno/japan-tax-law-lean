## Batch DE review (2026-11-25) — 地方税法 art.34 §1 四 ロ (ii)（旧生命保険料控除 中段: 1.5万円超4万円以下、15000+(total-15000)/2、上限40000で27500）/ OldLifeInsurancePremiumDeductionMid.lean（cycle-115 機械的独立照合・反例探索）

### DE-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当・上位セッションから独立）。coordinator 要約・STAGING・Lean doc-comment の「原文逐語」は**信じず**、pinned raw JSON のバイトから自前で再抽出した結果をもって判定した。
- **対象モジュール（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/OldLifeInsurancePremiumDeductionMid.lean`（Impl）、`JapanTaxLaw/OldLifeInsurancePremiumDeductionMidSpec.lean`（独立 Spec）、`JapanTaxLaw/OldLifeInsurancePremiumDeductionMidTests.lean`。
- **一次資料（pinned・改変禁止）**: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`。law_id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002`（地方税法、令和八年法律第二号による改正、施行 2026-11-01）は `data/INVENTORY.json` の `current_revision` と一致。raw の SHA-256 再計算は `3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53`、12,181,725 bytes で INVENTORY の `source_sha256` / `size_bytes` と一致。
- **独立抽出方法**: `law_full_text` を自前再帰 parse し、`MainProvision` 配下で `ArticleTitle = 第三十四条` の Article を同定（葉テキスト連結 13,009 文字 / U+3000 = 0、モジュール header の主張と一致）。漢数字は自前パーサ（万＝10,000、千＝1,000 の桁 grouping、かつ「X分のY＝Y/X」）で十進数・`fractions.Fraction` へ変換。needle は手打ちせず CI 実装 `scripts/ci/transcription_audit.py::checks()` を import して実文字列を取得。算術は Python 整数（Nat の saturating 減算を再現）で独立計算し、Lean は `lake env lean` の `#eval` / `#print axioms` で kernel 側を照合した。
- **書き込み制約の遵守**: 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ（read-then-write: 既存全文をバイト列として読み込み、末尾に本節を連結してから書き戻し、元バイト列の前方一致・SHA-256・件数を検証）。Lean モジュール / `data/*` / `scripts/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。

### DE-1. pinned 原文からの独立抽出と照合（art.34 §1 四 ロ (ii)）

- 正規化後 art.34 の当該 clause（offset 2,679 から 60 文字、U+3000 除去。doc-comment ではなく raw から直接取得）:

> `（ｉｉ）前年中に支払つた旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合一万五千円と当該合計額から一万五千円を控除した金額の二分の一に相当する金額との合計額`

| 原文箇所 | 自前抽出値 | Impl | 独立 Spec | 照合 |
|---|---|---|---|---|
| `一万五千円` | 一万五千 = 1×10,000 + 5×1,000 = **15,000** | `15000 +` / `- 15000` | `t/2 + 7500` と同値 | ✅ |
| `四万円` | 四万 = 4×10,000 = **40,000** | 上限 40000 で 27,500 | 同値 | ✅ |
| `二分の一` | **1/2**（分母二・分子一） | `/ 2` | `/ 2` | ✅ |
| 条件 `一万五千円を超え四万円以下` | **15,000 < total ≤ 40,000**（下限 strict・上限 inclusive） | doc-comment の適用域と一致 | 同域 | ✅ |
| 計算文言 `一万五千円と…控除した金額の二分の一に相当する金額との合計額` | `15000 + (total-15000)/2` | `deduction` 定義と逐語一致 | `t/2+7500` | ✅ |

- **桁違いの明示除外**: `一千五百円`（1,500）・`十五万円`（150,000）・`三分の一`（1/3）は当該 clause に **ABSENT** であり、自前抽出値（15,000 / 40,000 / 1/2）とも一致しない。`一万五千円` は `1500` でも `150000` でもなく、`二分の一` は `1/3` ではない（パーサは「X分のY＝Y/X」で算出し、1/2 を確認）。
- **原文忠実性**: 式 `15000 + (total - 15000) / 2` は原文の「一万五千円と当該合計額から一万五千円を控除した金額の二分の一に相当する金額との合計額」をそのまま写したものであり、加算順序・控除基数・二分の一の適用のすべてが一致する。
- **needle の非一意性（原文由来）**: needle1 は art.34 内に 2 回現れる（offset 2,697＝旧生命保険料 ロ (ii)、offset 4,808＝旧個人年金保険料 (ii)）。両者は同一の計算文言を持つため、needle の存在だけでは区分を同定できない。本レビューは clause レベルの自前抽出（「旧生命保険料の金額の合計額が一万五千円を超え四万円以下である場合」）で ロ (ii) を同定した（BY-DESIGN B-6）。

### DE-2. needle 健全性（CI `checks()` 実文字列 2 本を自前正規化原文で検証）

- `scripts/ci/transcription_audit.py::checks()` を自前 import し、check 名 `OldLifeInsurancePremiumDeductionMid.lean` のエントリ **1 件**（law_id `325AC0000000226`、kind `file`、art `None`）から needle **2 本**を取得（STAGING / doc-comment の申告は使用していない）。

| # | CI `checks()` 実文字列 | needle 内 U+3000 | 自前正規化全文（2,355,516 文字） | 自前正規化 art.34（13,009 文字） |
|---|---|---:|---|---|
| 1 | `一万五千円と当該合計額から一万五千円を控除した金額の二分の一に相当する金額との合計額`（42 文字） | 0 | FOUND（offset 110,550 / count 4） | FOUND（offset 2,697 / count 2） |
| 2 | `一万五千円を超え四万円以下である場合`（18 文字） | 0 | FOUND（offset 110,532 / count 4） | FOUND（offset 2,679 / count 2） |

- 正規化は CI と同一条件 `re.sub(r"[\s\u3000]+", "", s)` を**自前で適用**し、`.find()` / `.count()` で包含判定した。CI の `contains()` をそのまま呼んでも同一結論。**U+3000 = 0、2/2 FOUND**。
- ただし 2 本の needle はいずれも art.34 内で 2 回（旧生命／旧個人年金）一致するため、これは **presence 健全性の確認であり節同定の証明ではない**（DE-1・B-6 参照）。

### DE-3. 反例探索（指定 3 点 + 境界 + 独立 Spec + 全点走査）

- `Money := Nat`。Impl: `deduction t = 15000 + (t - 15000) / 2`（Nat 減算は saturating）。独立 Spec: `specDeduction t = t / 2 + 7500`。Python 独立計算と Lean `#eval` の両方で確認。

| `total` | Impl（Python / Lean `#eval`） | 独立 Spec | 判定 |
|---:|---:|---:|:--:|
| 15,000 | 15,000 | 15,000 | ✅ 境界（ロ (i) 側） |
| 15,001 | 15,000 | 15,000 | ✅ 1円未満切捨て |
| 16,000 | **15,500** | 15,500 | ✅ 指定点 |
| 25,000 | **20,000** | 20,000 | ✅ 指定点 |
| 39,999 | 27,499 | 27,499 | ✅ |
| 40,000 | **27,500** | 27,500 | ✅ 指定点・上限 |

- **全点走査**: `total = 15,000..40,000`（25,001 点）で Impl と独立 Spec の不一致数 **0**。さらに 40,001..100,000 も不一致 0。これは 15,000 が偶数なので `d = t - 15000` について `(15000+d)/2 = 7500 + d/2` が成り立ち、`15000 + d/2 = t/2 + 7500` と厳密相等するため（shift 同一性を d=0..99,999 で確認）。
- **Nat 飽和の扱い**: `total < 15,000` では減算が 0 に張り付き `deduction = 15,000` 固定。独立 Spec とは 0..14,999 の全 15,000 点で不一致だが、これは**当該区分外（1.5万円以下は (i) の別区分・NOT MODELLED）**であり、Impl の範囲内矛盾ではない（B-4）。
- **2.8万円 cap の不在**: `deduction(40,001) = 27,500`、`deduction(50,000) = 32,500`、`deduction(100,000) = 57,500` であり、2.8万円 total cap は実装されていない（原文の 2.8万円 cap は他区分・新生命側の規定であり、本中段モデルには包含されない＝B-3）。
- **反例探索で検出された原文・Impl 間の数値矛盾: 0 件（ゼロ）**。指定 3 点（15,500 / 20,000 / 27,500）はすべて Python 独立計算・Lean `#eval`・doc-comment 申告の三者一致。

### DE-4. 公理監査

- 一時 Lean ファイル `C:/Users/junny/AppData/Local/Temp/opencode/de_axioms.lean` を作成し、3 宣言（`deduction` / `specDeduction` / `agreeOldLifeInsurancePremiumDeductionMid`）に `#print axioms` を実行（`lake env lean`、**exit code 0**）。別途 `de_eval.lean` で `#eval` 8 点も実行。監査後、両一時ファイルおよび一時 Python スクリプト（`de_verify.py` / `de_append.py`）は**削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 3 |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |
| axiom-free（`does not depend on any axioms`） | **3 / 3** |

→ **禁止公理（choice / sorryAx / Quot.sound）および propext を含むいずれの公理依存も 0。公理監査は合格。**

### DE-5. CONFIRMED / BY-DESIGN / UNRESOLVED の分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0** |
| **BY-DESIGN** | **6** |
| **UNRESOLVED** | **2** |

> **発見ゼロを明示する。** 数値・needle・反例・走査・公理・pin のいずれにも矛盾はなく、CONFIRMED（欠陥）は **0 件（ゼロ）**。

#### CONFIRMED（0 件）

- なし。pinned 原文からの独立抽出値（15,000 / 40,000 / 1/2）、式、needle 2/2、指定 3 点、走査、公理すべてが整合した。

#### BY-DESIGN（6 件）

- **B-1 他区分 NOT MODELLED**: 原文 clause の直前 `(i)`「一万五千円以下である場合当該合計額」、直後 `(iii)`「四万円を超え七万円以下である場合二万七千五百円と当該合計額から四万円…」を pinned art.34 で確認。1.5万以下／4万〜7万／7万超は本モデルの対象外であり、doc-comment の NOT MODELLED 宣言と整合。
- **B-2 新生命／介護／個人年金区分 NOT MODELLED**: 本モデルは「旧生命保険料」のみ。pinned art.34 には旧個人年金保険料の同一文言（offset 4,808）や新生命・介護の別区分が存在するが、これらは形式化されていない（needle が両者に共通するのもこのため）。
- **B-3 2.8万円 total cap NOT MODELLED**: `deduction(50,000) = 32,500`、`deduction(100,000) = 57,500` であり cap は実装されていない。原文の 2.8万円 cap は本中段の文言には含まれず、スコープ宣言どおり。
- **B-4 Nat 飽和はモデル選択**: `total < 15,000` で `deduction = 15,000` に張り付き、独立 Spec と不一致（15,000 点）。当該区分外の入力に対する実装上の振る舞いであり、原文はこの域をロ (ii) として規定しない。
- **B-5 端数処理は model candidate**: 当該 clause に「円未満」「切捨て」「四捨五入」等の丸め文言は ABSENT。Impl doc-comment の「1円未満切捨て」は `Nat` 整数除算（floor）による表現選択であり、pinned 原文に直接の根拠はない。
- **B-6 CI needle の非一意性（presence のみ）**: 2 本の needle はいずれも art.34 内で旧生命／旧個人年金の 2 か所に一致（count 2）。CI の transcription audit は presence を検証するだけで節を同定しないため、ロ (ii) の同定は本レビューの clause レベル抽出で補完した。モデル自体の誤りではない。

#### UNRESOLVED（2 件）

- **U-1 未形式化範囲の法的十分性**: B-1〜B-3（他区分・新生命／介護／個人年金・2.8万円 cap）はスコープ宣言済みだが、art.34 §1 四 ロ (ii) の中段計算式のみをもって旧生命保険料控除の理解として足りるかは pinned 原文から決定不能。**人間の法律専門家によるレビューを要する。**
- **U-2 端数処理の法的根拠**: 「二分の一に相当する金額」の 1 円未満の丸め規則が当該 clause に存在せず、`Nat` 除算による切捨ての法的正否は原文のみでは判断できない（モデル値の誤りではない）。**人間の法律専門家によるレビューを要する。**

### DE-6. 最終報告（サマリ）

- **CONFIRMED: 0 件／BY-DESIGN: 6 件／UNRESOLVED: 2 件**。数値・needle・反例・走査・公理の不一致は **0 件（ゼロ）** であり、発見ゼロを本節に明示する。
- **needle 健全性**: CI `checks()` 実文字列 **2 本**を自前 import・自前正規化で検証し、**U+3000 = 0、2/2 FOUND**（全文 count 4 / art.34 count 2）。
- **反例**: 指定 3 点（15,500 / 20,000 / 27,500）を含む 6 点で Python 独立計算＝Lean `#eval`＝独立 Spec。15,000..40,000 の 25,001 点走査で不一致 0（40,001..100,000 も 0）。`total < 15,000` は Nat 飽和により Spec と不一致だが区分外。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` すべて **0 件**（3/3 axiom-free、exit code 0）。一時ファイルは削除済み。
- **pinned 照合**: revision / SHA-256 / サイズ一致、`一万五千円` = 15,000、`四万円` = 40,000、`二分の一` = 1/2、条件「超え…以下」、式 `15000+(total-15000)/2` を確認。桁違い（1,500 / 150,000 / 1/3）は明示除外。
- **追記後レビュー件数**: 既存 **106 件**をすべて保持 ＋ DE 1 件 ＝ **107 件**。coverage ledger の正規表現 `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` の一致件数は書き込み後再検証の結果 **107 件**。既存セクション（Batch G〜DD を含む 106 件）は一切改変していない。
- **書き込み・操作の制約**: Lean モジュール / `data/*` / `scripts/*` は読み取り専用を遵守。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。commit / push / merge / ブランチ切替は行っていない。

> **本レビューは機械的独立照合（pinned 原文 parse・漢数字抽出・needle 健全性・反例/走査・独立 Spec 比較・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

