# Adversarial Review — Batch 11（独立機械クロスチェック）

- レビュー日: 2026-11-21 / 役割: Adversarial Review Agent（形式化担当から独立）
- **性質: 機械的独立照合であり、人間の法解釈レビューではない。** 欠陥件数を手柄にしない。
- 手法: 各モジュールの doc-comment / `transcription_audit.py` を信じず、pinned raw JSON の `law_full_text` を自前 Python で再帰平坦化し `Article` を `attr.Num` で定位、U+3000/空白を `re.sub(r"[\s　]+","",...)` で正規化して原文リテラル・式を抽出。pinned 原文から導いた整数式を同一スクリプト内で独立再実装し、`.lean` / `-Spec.lean` / `-Tests.lean` の `by decide` / `rfl` 期待値と照合。操作は `D:\CodexData\Temp\advrev_11` の使い捨て Python（実行後に削除）。本環境では `lake` / `lean` が PATH になくカーネル再実行は未実施。
- H/T/D/C/U (Sponsor Directive §5): H=反証可能な仮説, T=再現テスト, D=判定(BY-DESIGN/CONFIRMED/UNRESOLVED), C=競合解釈, U=残存不確実性。

### RefundInterest.lean — 国税通則法 第58条（還付加算金）

- **pinned ids**: law_id `337AC0000000066` / rev `337AC0000000066_20261101_507AC0000000013`（施行 2026-11-01, amend `507AC0000000013`）; `data/raw/337AC0000000066_20261101_507AC0000000013.law.json` を独立再計算 → SHA-256 `6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE`（実測 946,927 bytes; `data/INVENTORY.json` の `source_sha256` と一致）。自前 Python で `Article attr.Num="58"` を 2 件検出 → caption「（還付加算金）」の本体 1 件を **LOCATED**（他 1 件は caption「（国税通則法の一部改正に伴う経過措置）」の附則で無関係）。原文 leaf 1,528 文字（正規化後 1,526）を独立抽出。doc-comment / `transcription_audit.py` は未使用。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「その金額に年七・三パーセントの割合を乗じて計算した金額（以下「還付加算金」という。）」 | 7.3% = 73/1000 | `refundInterestRate = delinquencyLowRate = ⟨73,1000⟩` | ✅ |
  | 「その差押命令又は差押処分の送達を受けた日の翌日から七日を経過した日までの期間」 | 控除期間 7 日 | `attachmentExclusionDays = 7` | ✅ |
  | 「その仮差押えがされている期間」 | 日数は caller-established | `attachmentExclusionDays` に日数引数なし | ✅ BY-DESIGN |
  | 利率が art. 60 低率と同一（既存定数の再利用） | 73/1000 を再利用 | `refundInterestRate_eq_delinquencyLowRate` (rfl) | ✅ |
  | 日割りの分母（年何日）・還付加算金本体・起算日/支払決定日の特定 | 原文に分母の明示なし → 非モデル化 | モデル外（doc-comment の scope 申告） | ✅ BY-DESIGN |
- **反例**: 独立 Python で `apply_floor(m)=m*73//1000`, `apply_ceil(m)=(m*73+999)//1000` を再計算し 8 点を照合 → **全一致, 矛盾 0**。境界: `applyFloor 0=0`（零入力）, `applyFloor 13=949//1000=0`（小さい正の入力 1..13, 切捨てで 0 に飽和）, `applyCeil 1=(73+999)//1000=1`（結果=入力の単位元境界）, `applyFloor 14=1022//1000=1`（1..13 を出た最初の非零）, `attachmentExclusionDays=7`, `num=73`, `den=1000`。doc-comment の 5 needle（七・三パーセント／還付加算金／七日を経過した日までの期間／仮差押え／七日）は原文・Lean 共に **各 1 回以上** 出現を count で確認。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 3: ①日割り換算の分母は原文に明示なく架空の 365 日等を仮定しない（doc-comment の検証規則遵守）、②仮差押え期間の日数・各号の起算日・支払決定日・還付加算金本体は caller-established、③ 2 項一の「七日」を `attachmentExclusionDays=7` として固定するのは原文「送達を受けた日の翌日から七日を経過した日まで」と整合（＝7 日間）。第 58 条の 2 ヒットのうち附則側を誤定位していないことも確認。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=利率 7.3%(73/1000)・控除 7 日が原文と食い違う, 又 日割り分母を架空に仮定している; T=5 needle 一致 + 8 点独立再計算（applyFloor/applyCeil/定数）⇔全 `by decide`/`rfl`; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 3）; C=「年 7.3% を日割りするなら /365 では」という解釈は原文に分母がなく架空仮定を避ける（通則法 art.60 と同じく pinned 条文は割合のみ）; U=政令の日割り換算・還付加算金の実際の金額計算・各号の起算日特定・2 項二の日数は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\advrev_11` に置き削除済み。

### SpouseRelief.lean — 相続税法 第19条の2（配偶者に対する相続税額の軽減）

- **pinned ids**: law_id `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`（施行 2026-04-01, amend `506AC0000000008`）; `data/raw/325AC0000000073_20260401_506AC0000000008.law.json` を独立再計算 → SHA-256 `C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7`（856,326 bytes; doc-comment 及び `data/INVENTORY.json` の `source_sha256` と一致）。自前 Python で `Article attr.Num="19_2"` を 1 件検出、caption「（配偶者に対する相続税額の軽減）」→ **LOCATED**。原文 leaf 1,944 文字（正規化後も 1,944）を独立抽出。doc-comment / `transcription_audit.py` は未使用。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「（第一号）当該配偶者につき第十五条から第十七条まで及び前条の規定により算出した金額」 | 軽減前税額（caller-supplied） | `taxBeforeRelief` | ✅（数字表記違い: doc は `第15条〜第17条` とアラビア数字） |
  | 「（第二号）相続税の総額に、次に掲げる金額のうちいずれか少ない金額が…課税価格の合計額のうちに占める割合を乗じて算出した金額」 | 総額 × min(イ,ロ)/総課税価格 | `taxBeforeRelief * relevantBasis / totalAcquisition` | ✅ / ⚠ 下記 U 参照 |
  | 「民法第九百条…当該配偶者の相続分を乗じて算出した金額（…相続人が当該配偶者のみである場合には、当該合計額）」 | only-heir → イ = 総課税価格 | `spouseReliefYiBasis` の `if spouseIsOnlyHeir then totalAcquisition` | ✅ BY-DESIGN（放棄の括弧は非モデル化） |
  | 「当該金額が一億六千万円に満たない場合には、一億六千万円」 | 下限 160,000,000（厳密 `<`） | `if raw < 160_000_000 then 160_000_000 else raw` | ✅ |
  | 「（ロ）当該配偶者に係る相続税の課税価格に相当する金額」 | ロ（caller-supplied） | `spouseAcquisition` | ✅ |
  | 「残額があるときは当該残額をもつて…税額とし、第一号が第二号以下であつたときは…ないものとする」 | taxAfter = max(第一号−第二号, 0) | `taxAfterSpouseRelief = taxBeforeRelief - spouseRelief`（Nat saturating） | ✅ |
  | 2 項（申告期限までに未分割）・3 項〜6 項（添付書類・隠蔽仮装行為） | 手続・適用条件は非モデル化 | モデル外（`$2/$3/$4/$5` 条件は doc-comment が out of scope と申告） | ✅ BY-DESIGN |
- **反例**: 独立 Python で `yi/if-only`, `relevant=min(yi,acq)`, `relief=0 if total=0 else tax*relevant//total`, `taxAfter=tax-relief` を再実装し 7 点を照合 → **全一致, 矛盾 0**。境界: `relief(0,0,0,100,F)=0`（分母 0 の下限）, `relief(0,5,13,13,F)=5`（小さい正の入力 1..13, 下限 160M が効くが ロ=5 が min を決定）, `relief(0,13,13,7,T)=7`（結果=taxBefore の単位元境界）, `relief(100M,200M,400M,10M,F)=4M`, `relief(160M,300M,400M,100M,F)=40M`（一億六千万円ちょうどは下限を適用しない＝厳密不等式）, `relief(200M,200M,400M,10M,F)=5M`, `relief(50M,400M,400M,100M,T)=100M`（全額軽減で taxAfter=0）。`-Spec.lean` の独立定式（`max/min` 版・Nat の 0 除算版）及び `agreeSpouseRelief` の 7 サンプル（零総額サンプルを含む）とも一致。needle 照合で 3 点の**表記ゆれ**を検出: ①doc は `第15条〜第17条`（原文は漢字数字）, ②doc の引用「…一億六千万円に満たない場合には、一億六千万」は末尾「円」を 1 字落としているが Lean 定数は正しく `160_000_000`＝一億六千万円, ③doc は「相続人が配偶者のみである場合」から放棄に関する挿入括弧を省略（原文は「相続人（相続の放棄があつた場合には…）が…」）。いずれも原文の実質・Lean モデルに影響せず **CONFIRMED 扱いにしない**。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 4: ①第一号・第二号の税額、配偶者の法定相続分（民法 art.900）・課税価格は caller-established で金額式に入れず、②2 項の未分割財産・3 項〜6 項の添付/隠蔽仮装の適用条件は非モデル化、③「割合を乗じて」を Nat 整数除算（切捨）で表現（原文に端数処理の明記なし）、④第一号が第二号以下なら税額なしを Nat saturating 減算で表現。上式 ② の乗数に `taxBeforeRelief`（第一号の配偶者税額）を流用している点は、配偶者のみの相続では「相続税の総額」と一致し当該 L4 slice の fully-allocated シナリオでは整合するが、複数相続人では caller が総額を渡す前提（下記 U）。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=軽減式・一億六千万円の下限・only-heir 分岐・saturating 減算が原文と食い違う; T=6 needle の原文一致（表記ゆれ 3 点を明示）+ 7 点独立再計算 & `-Spec` の `agreeSpouseRelief` 7 サンプル⇔全一致; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4）; C=第二号の乗数「相続税の総額」を配偶者自身の第一号税額で代用する解釈は原文と厳密には異なるが、配偶者のみの相続では一致し fully-allocated モデルとして doc-comment が申告済み（競合解釈として記録）; U=複数相続人時に `taxBeforeRelief` へ渡すべき「相続税の総額」の具体値・民法 art.900 の相続分（放棄含む）・端数処理・2 項〜6 項の適用条件は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。カーネル再実行は未実施。一時 Python は `D:\CodexData\Temp\advrev_11` に置き削除済み。

### StampDuty.lean — 印紙税法 第20条（過怠税）

- **pinned ids**: law_id `342AC0000000023` / rev `342AC0000000023_20261001_507AC0000000070`（施行 2026-10-01, amend `507AC0000000070`）; `data/raw/342AC0000000023_20261001_507AC0000000070.law.json` を独立再計算 → SHA-256 `263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F`（599,893 bytes; doc-comment 及び `data/INVENTORY.json` の `source_sha256` と一致）。自前 Python で `Article attr.Num="20"` を 1 件検出、caption「（印紙納付に係る不納税額があつた場合の過怠税の徴収）」→ **LOCATED**。原文 leaf 834 文字（正規化後も 834）を独立抽出。doc-comment / `transcription_audit.py` は未使用。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 1 項「当該納付しなかつた印紙税の額とその二倍に相当する金額との合計額に相当する過怠税」 | 未納 + 2×未納 = 3×未納 | `stampAuditPenalty u = u + u*2`（`= u*3` を定理で固定） | ✅ |
  | 2 項「当該印紙税の額に百分の十の割合を乗じて計算した金額との合計額に相当する金額」 | 未納 + 10% = 110% | `stampDeclaredPenalty u = u + (u*10)/100` | ✅ BY-DESIGN（端数は Nat 切捨） |
  | 3 項「当該消されていない印紙の額面金額に相当する金額の過怠税」 | 過怠税 = 未消印の額面 | `stampUncancelledPenalty face = face` | ✅（doc-comment は「・・・（第三号）」と略記し原文逐語引用なし） |
  | 4 項「過怠税の合計額が千円に満たないときは、これを千円とする」 | 合計 < 1000 → 1000（1000 ちょうどは据え置き） | `stampDutyFloor a = if a < 1_000 then 1_000 else a` | ✅ |
  | 5 項「第二項の規定の適用を受けた過怠税のみに係る合計額であるときは、前項の規定の適用はない」 | 申告分のみなら floor 非適用 | `stampFloorExempt f = (audit=0 && uncancelled=0)` / `stampAggregatePenalty` | ✅ |
  | 2 項の「予知してされたものでないとき」・6 項（通知書附記）・7 項（税目） | 適用条件・行政手続は非モデル化 | モデル外（Bool 引数なし） | ✅ BY-DESIGN |
- **反例**: 独立 Python で `audit=u+u*2`, `declared=u+(u*10)//100`, `floor=a if a>=1000 else 1000`, `aggregate=raw if exempt else floor(raw)` を再実装し 17 点を照合 → **全一致, 矛盾 0**。境界: `audit 0=0`, `audit 334=1002`（原文の 333×3=999<1000 と 334×3=1002 の境界を spec も保持）, `audit 13=39`（小さい正の入力 1..13）, `declared 0=0`, `declared 100=110`, `declared 34=37`, `declared 35=38`（10% の切捨め境界）, `declared 13=14`（13+130//100=13+1）, `declared 1=1`（10% が 0 に切捨てられ結果=入力の単位元境界）, `floor 999=1000`, `floor 1000=1000`, `aggregate ⟨0,0,0⟩=0`, `aggregate ⟨0,0,999⟩=999`（5 項で floor 除外）, `aggregate ⟨0,999,0⟩=1000`, `aggregate ⟨2000,100,500⟩=2600`, `auditFloor 1=1000`（小入力が floor で飽和）, `uncancelled 0=0`。`-Spec.lean` の `specAuditPenalty`/`specDeclaredPenalty`/`specFloor`/`specStampAggregatePenalty` と `stampCheckGrid`（30 点格子上の一致）/ `agreeStampPenaltyPoints`（16 点）とも整合。5 needle は原文・Lean 共に出現（3 項のみ doc-comment が略記のため逐語不一致だが実装は一致）。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 4: ①2 項の 10% の端数は Nat 整数除算（切捨）で表現（原文に端数処理の明記なし）, ②2 項の「予知してされたものでない」該当性・政令で定める申出手続は caller-established で Bool 化せず、③4 項の floor を 5 項の申告分のみに適用除外する判定を `audit=0 && uncancelled=0` で表現、④6 項/7 項の行政通知・税目は非計算内容として非モデル化。1 項の二倍→三倍、4 項の「千円に満たない」→厳密 `< 1000` も原文と整合。**LOCATED, UNRESOLVED なし**。
- **H/T/D/C/U**: H=過怠税の三倍則・10% 加算・千円 floor・5 項の floor 除外が原文と食い違う; T=5 needle 一致 + 17 点独立再計算 & `-Spec` の `stampCheckGrid`/`agreeStampPenaltyPoints`⇔全一致; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4）; C=2 項のみの合計に 4 項 floor をかける解釈は 5 項で明示的に排斥されており実装も exempt で排斥、又 10% の端数を四捨五入する解釈もあり得るが原文に明記なく Nat 切捨を選択; U=政令で定める申出手続・「予知」該当性・10% 端数処理の法的取扱い・複数課税文書の完全集計は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。カーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python は `D:\CodexData\Temp\advrev_11` に置き削除済み。
