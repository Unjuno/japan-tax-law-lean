# Adversarial Review — Batch 12（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）。**機械的独立照合であり人間の法解釈レビューではない。**
- 手法: doc-comment / `transcription_audit.py` は不信。自前 Python（使い捨て `D:\CodexData\Temp\advrev_12`, 実行後削除）で `law_full_text` を再帰平坦化（全 10,071 ノード, Article 530）, `attr.Num` で定位, `re.sub(r"[\s\u3000]+","",…)` で正規化し原文リテラルを抽出。pinned 原文から導いた式を独立再実装し `.lean`/`-Spec`/`-Tests` の `by decide` 期待値と照合。本環境に `lake`/`lean` がなくカーネル再実行は未実施。

### CustomsProcedureRates.lean — 関税法 第十四条の五

- **pinned ids**: law_id `329AC0000000061` / rev `329AC0000000061_20260601_508AC0000000005`（rev.INFO の `law_revision_id` と一致, 施行 `2026-06-01`, amend `508AC0000000005`）; `data/raw/329AC0000000061_20260601_508AC0000000005.law.json` を独立再計算 → SHA-256 `1701272A2E4EAF434B6D953026C340EFA4E15B2CA952FC941EEEB676D32204EA`（実測 1,266,341 bytes）。自前 Python で `attr.Num="14_5"` を **1 件**検出、caption「（換価代金からの充当又は徴収の特例）」→ **LOCATED**。原文 leaf 291 文字（正規化後も 291）を独立抽出。doc-comment の引用文字列は正規化原文に **1 回**一致（逐語）。`attr.Num="7_17"`（1 件）, `"11"`（2 件, 内 1 件は附則で無関係）も定位し計算式不在を確認。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「公売又は売却の費用その他関税に先だつて徴収される費用がある場合には、これらの費用を控除した額」 | 控除後代金 = 代金 − 費用 | `replacementNetProceeds g c = g - c`（Nat saturating） | ✅ |
  | 「当該貨物又は物件の公売又は売却による代金の額（…控除した額）を限度とする」 | 充当額 = min(関税額, 控除後代金) | `cappedReplacementDuty g c d = min d (net g c)` | ✅ |
  | 「充て又は徴収する関税の額は、…を限度とする」 | within-cap = 関税額 ≤ 控除後代金 | `replacementDutyWithinCap = decide (d ≤ net g c)` | ✅ |
  | 第七条の十七（書面通知義務）・第十一条（徴収は「国税徴収の例による」） | 金額×率・控除・上限の計算式なし | 非モデル化 | ✅ BY-DESIGN |
  | 本条に税率数値なし（「Rates」はファイル名由来） | 率を定めない | 率定数なし | ✅ BY-DESIGN |
  | 費用 > 代金のときの扱いは原文に明記なし | saturating で 0（入力妥当性は caller） | `Nat.sub` / `replacementNetProceeds_zero_of_over` | ✅ BY-DESIGN |
- **反例**: 独立 Python で `net=g-c if g>c else 0`, `capped=min(d,net)`, `within=d<=net` を再実装し **15 点**を照合 → **全一致, 矛盾 0**。境界: `net(1_000_000,1_000_000)=0`（費用=代金）, `net(1_000_000,1_200_000)=0`（underflow）, `net(0,5_000)=0`, `net(500_000,150_000)=350_000`, `capped(1_000_000,200_000,900_000)=800_000`（上限が効く）, `capped(…,800_000)=800_000`（境界で同値）, `capped(…,300_000)=300_000`（上限非作動）, `capped(1_000_000,1_200_000,300_000)=0`, `within(…,800_000)=true` / `(…,800_001)=false`（≤ の境界）, `within(…,0)=true`。`-Spec` の独立定式（`if` case-split 版）の 6 点 & `agreeCustomsProcedureRates` 7 サンプルとも整合。needle 4 語（公売又は売却による代金の額／これらの費用を控除した額／関税に先だつて徴収される費用／を限度とする）は原文・Lean 共に出現確認。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 4: ①第七条の十七・第十一条は計算式なしで非モデル化, ②代金・費用・関税額は caller-established（算定方法・明細・適用判定は本条に数式なく射程外）, ③ underflow を saturating 0 とし入力妥当性を caller に委ねる, ④ 本条に税率がなく率を定めない。控除→上限（min）→判定（≤）の構造は原文「費用を控除した額を限度とする」と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=控除式・上限 min・within ≤ が原文と食い違う, 又 計算式なき条を誤モデル化している; T=4 needle + verbatim 引用一致 + 15 点独立再計算 & `-Spec`/`-Tests` 期待値⇔全一致; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4）; C=「限度」を对被徴収額の上限ではなく代金側の下限と読む解釈もあり得るが原文「…を限度とする」は代金が上限を示す実装が妥当, 又 underflow をエラー/未定義とする解釈もあり得るが原式に記載なく saturating を選択; U=公売・売却代金/費用の具体額・第85条1項/第88条/第134条5・6項の「不足額」算定・国税通則法38条1項該当性は caller-established／要専門家。
- **限定**: 機械的独立クロスチェックであり**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\advrev_12` に置き削除済み。
