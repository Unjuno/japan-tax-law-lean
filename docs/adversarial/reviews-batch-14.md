# Adversarial Review — Batch 14（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）。**機械的独立照合であり人間の法解釈レビューではない。**
- 手法: doc-comment / `transcription_audit.py` は不信。自前 Python（使い捨て `D:\CodexData\Temp\opencode\_adv14_*.py`, 実行後削除）で pinned 生 JSON の SHA-256 を再計算し, `law_full_text` を再帰平坦化して `Article` を `attr.Num` + caption「（税率）」で定位, U+3000/空白を正規化して原文リテラルを抽出。漢数字を自前パーサで整数化し Lean 定数・kernel 決定例と照合。本環境に `lake`/`lean` なくカーネル再実行は未実施（`rfl` / `by decide` は構成上カーネル判定される期待値として扱う）。

### GasolineTaxRate.lean — 揮発油税法 第九条（税率）

- **pinned ids**: law_id `332AC0000000055` / rev `332AC0000000055_20260525_506AC0000000052`（`revision_info.law_revision_id` と一致, 施行 `2026-05-25`, law_title `揮発油税法`）; `data/raw/332AC0000000055_20260525_506AC0000000052.law.json`（実測 156,715 bytes）を独立再計算 → SHA-256 `e5e7d4286963a6424652cc86c75341a6c64d972e4e3e7ef22670ddcf2801de9a`（pinned 値と一致）。自前 Python で `Article attr.Num="9"` を 2 件検出, うち caption「（税率）」の 1 件を **LOCATED**（他方は caption「（政令への委任）」で除外）。原文 leaf「揮発油税の税率は、揮発油一キロリットルにつき二万四千三百円とする。」を抽出（doc-comment 逐語引用は正規化原文に 1 回一致, U+3000/空白なし）。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「一キロリットルにつき二万四千三百円」 | 漢数字パーサ: 二万四千三百 = 2×10000+4×1000+3×100 = 24,300 円/kL | `ratePerKilolitre = 24_300`（rfl） | ✅ |
  | 「揮発油税の税率は…とする」 | 税額 = 数量(kL) × 24,300（線形適用） | `taxForKilolitres k = k * ratePerKilolitre` | ✅ BY-DESIGN |
  | 数量の単位・定義域（kL, Nat） | 原文に明示なし（caller-established） | `kilolitres : Money`（Nat） | ✅ BY-DESIGN |
  | 第十条/第十一条（申告）ほか非モデル化 | 金額算術なし, scope 外 | doc-comment が scope 申告 | ✅ BY-DESIGN |
- **反例**: 独立 Python で `g(n)=24,300×n` を再実装し **5 点**を照合 → 全一致, 矛盾 0。`g(0)=0`, `g(1)=24,300`, `g(2)=48,600`, `g(3)=72,900`, `g(100)=2,430,000` はすべて `-Tests.lean` の `rfl` / `by decide` 期待値と一致。桁誤り仮説 243,000 / 2,430 は独立計算 24,300 と不一致で `rate_not_scaled` にも排斥。再帰和 `specSum` との全面一致定理 `agree_gasoline_tax` も期待どおり。横断和 24,300 + 地方 4,400 = 28,700 も独立再計算で一致。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①24,300円/kL 単価からの線形拡張（原文は kL 単価のみで総額算定手続は非記載）, ②数量を Nat の `Money` とする定義域, ③納税義務者・課税標準・申告・免税・附則の非モデル化。境界 5 点すべて整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=24,300 の桁誤り, 単価≠総額適用, 定義域/線形性の架空仮定; T=Article Num=9 + caption 税率 LOCATED + 原文リテラル 1 回一致 + 漢数字独立整数化 24,300 + 5 点再計算⇔全 kernel 期待値; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 3）; C=「一キロリットルにつき…とする」を累進/別単位と読む解釈も理論上あり得るが原文に根拠なく線形単価を採用, 定義域を負数/実数とする解釈もあるが Nat を選択; U=数量の確定・課税標準(第八条)・納税義務者(第三条)・申告(第十/十一条)・免税(第十四〜十六条)・端数/附則は caller-established／要専門家。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 例はカーネル判定される期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv14_*.py` に置き削除済み。

### LocalGasolineTaxRate.lean — 地方揮発油税法 第四条（税率）

- **pinned ids**: law_id `330AC0000000104` / rev `330AC0000000104_20260401_508AC0000000012`（`revision_info.law_revision_id` と一致, 施行 `2026-04-01`, law_title `地方揮発油税法`）; `data/raw/330AC0000000104_20260401_508AC0000000012.law.json`（実測 90,853 bytes）を独立再計算 → SHA-256 `c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a`（pinned 値と一致）。自前 Python で `tag=Article, attr.Num="4"` を 1 件検出（同号の Paragraph/Item は除外）, caption「（税率）」で **LOCATED**。原文 leaf「地方揮発油税の税率は、揮発油一キロリットルにつき四千四百円とする。」を抽出（doc-comment 逐語引用は正規化原文に 1 回一致, U+3000/空白なし）。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「一キロリットルにつき四千四百円」 | 漢数字パーサ: 四千四百 = 4×1000+4×100 = 4,400 円/kL | `ratePerKilolitre = 4_400`（rfl） | ✅ |
  | 「地方揮発油税の税率は…とする」 | 税額 = 数量(kL) × 4,400（線形適用） | `taxForKilolitres k = k * ratePerKilolitre` | ✅ BY-DESIGN |
  | 数量の単位・定義域（kL, Nat） | 原文に明示なし（caller-established） | `kilolitres : Money`（Nat） | ✅ BY-DESIGN |
  | 第七条の二百八十七分の四十四・非モデル化 | 税率相互作用は金額算術としてscope外 | doc-comment が scope 申告 | ✅ BY-DESIGN |
- **反例**: 独立 Python で `l(n)=4,400×n` を再実装し **5 点**を照合 → 全一致, 矛盾 0。`l(0)=0`, `l(1)=4,400`, `l(2)=8,800`, `l(3)=13,200`, `l(100)=440,000` はすべて `-Tests.lean` の `rfl` / `by decide` 期待値と一致。桁誤り仮説 44,000 / 440 は独立計算 4,400 と不一致で `rate_not_scaled` にも排斥。再帰和 `specSum` との全面一致定理 `agree_local_gasoline_tax` も期待どおり。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①4,400円/kL 単価からの線形拡張（原文は kL 単価のみで総額算定手続は非記載）, ②数量を Nat の `Money` とする定義域, ③第七条の 44/287 率・課税標準・申告・附則の非モデル化。境界 5 点すべて整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=4,400 の桁誤り, 単価≠総額適用, 44/287 相互作用の混入, 定義域/線形性の架空仮定; T=Article Num=4 + caption 税率 LOCATED + 原文リテラル 1 回一致 + 漢数字独立整数化 4,400 + 5 点再計算⇔全 kernel 期待値; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 3）; C=「一キロリットルにつき…とする」を累進/別単位と読む解釈も理論上あり得るが原文に根拠なく線形単価を採用, 定義域を負数/実数とする解釈もあるが Nat を選択; U=数量の確定・課税標準(第三条)・納税義務者(第五条)・申告(第七条, 44/287)・未納税移出(第六条)・附則は caller-established／要専門家。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 例はカーネル判定される期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\opencode\_adv14_*.py` に置き削除済み。
