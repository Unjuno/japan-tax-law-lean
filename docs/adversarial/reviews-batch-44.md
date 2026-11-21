# Adversarial review — batch 44

### SixMonthPeriodDeeming.lean — 納税貯蓄組合法施行令 第三条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="3"` を定位・正規化。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/326CO0000000099_20191216_501CO0000000183.law.json`（law 326CO0000000099, revision 326CO0000000099_20191216_501CO0000000183, 納税貯蓄組合法施行令, CabinetOrder）。
- SHA-256 再計算: `4bea6d03094f44349178f1f6be77f66c0f71ac107cd78b8a5edab5081fc9e84c`（生バイト 16753 バイト）→ CONFIRMED。
- Article 定位: `Num="3"` を構造走査で 1 件検出、needle はその Article ノード内に verbatim 1 回（原文全体でも 1 回）→ CONFIRMED。
- 逐語照合: needle「前項に規定する利子計算期間又は事業年度が六月をこえる場合においては、同項の規定の適用については、当該利子計算期間又は事業年度開始の日から六月ごとに区分した期間（最後に六月未満の期間を生じたときは、当該期間）を、それぞれ一利子計算期間又は一事業年度とみなす。」は原文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 数詞・区分け再計算: 「六月」= 6 月（STRICT `> 6` が発動、ちょうど 6 月は発動せず）。ceil(月数/6) を独立に再計算し 6→1, 7→2（六月未満の端数も 1 区分）, 12→2, 13→3, 18→3 の 3 件以上の区分ケースを確認 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 specChunk=6 と独自式 specSegments/specDeeming のみで impl 識別子なし）、`spec_literals` = {6}（`- 1` は天井除の構造項、statutory numeral は 6 のみ）、`source_literals_verified` True（原文に「六」verbatim）、`boundary_evidence_categories` = {zero, small_input, saturation} → CONFIRMED。
- 橋渡し: agreeSegments / agreeDeeming はいずれも unfold 後の純粋 `rfl` で、by_cases / omega / Classical.choice / propext を用いない axiom-free の普遍定理 → CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的なみなし規則「六月をこえる」を STRICT `> 6` とし、6 月ごとの区分と六月未満の端数の 1 区分カウント、各区分を一利子計算期間／一事業年度とみなすことのみをモデル化。前項の定義、金融機関の特例（第三項）、利子計算、他の条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第三条第2項の「六月をこえる場合」の区分・みなし規定のみ。発動は STRICT > 6。
- T（逐語性）: 自前再抽出の needle が原文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: segmentCount = ceil(月数/6) を独自 specChunk 版で再定式化。境界の rfl 橋渡しは追加公理を導入しない。
- C（整合）: 0/1/6/7/12/13/18 の区分値と 6=false, 7=true の発動境界で impl↔spec 一致、矛盾 0。
- U（範囲外）: 前項の利子計算期間／事業年度の定義、第三項の金融機関特例、利子額の計算、他の条項は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
