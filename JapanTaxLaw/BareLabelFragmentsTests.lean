import JapanTaxLaw.BareLabelFragments
import JapanTaxLaw.BareLabelFragmentsSpec

/-!
# BareLabelFragmentsTests — 全variantのラベル構造をカーネル検証

These units remain PROVED_SCOPE: only label/ordinal structure is proven,
the normative content of the provisions using them is NOT MODELLED.
-/
namespace JapanTaxLaw.BareLabelFragmentsTests

open JapanTaxLaw.BareLabelFragments

example : headingDeclared = true := rfl

example : kanaOrdinal 'ア' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ア' := by decide
example : kanaOrdinal 'ア' = some 36 := by decide
example : kanaOrdinal 'イ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'イ' := by decide
example : kanaOrdinal 'イ' = some 1 := by decide
example : kanaOrdinal 'ウ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ウ' := by decide
example : kanaOrdinal 'ウ' = some 24 := by decide
example : kanaOrdinal 'オ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'オ' := by decide
example : kanaOrdinal 'オ' = some 27 := by decide
example : kanaOrdinal 'カ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'カ' := by decide
example : kanaOrdinal 'カ' = some 14 := by decide
example : kanaOrdinal 'ク' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ク' := by decide
example : kanaOrdinal 'ク' = some 28 := by decide
example : kanaOrdinal 'ス' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ス' := by decide
example : kanaOrdinal 'ス' = some 47 := by decide
example : kanaOrdinal 'ソ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ソ' := by decide
example : kanaOrdinal 'ソ' = some 18 := by decide
example : kanaOrdinal 'ソ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ソ' := by decide
example : kanaOrdinal 'ソ' = some 18 := by decide
example : kanaOrdinal 'タ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'タ' := by decide
example : kanaOrdinal 'タ' = some 16 := by decide
example : kanaOrdinal 'タ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'タ' := by decide
example : kanaOrdinal 'タ' = some 16 := by decide
example : kanaOrdinal 'チ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'チ' := by decide
example : kanaOrdinal 'チ' = some 8 := by decide
example : kanaOrdinal 'ツ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ツ' := by decide
example : kanaOrdinal 'ツ' = some 19 := by decide
example : kanaOrdinal 'ト' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ト' := by decide
example : kanaOrdinal 'ト' = some 7 := by decide
example : kanaOrdinal 'ナ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ナ' := by decide
example : kanaOrdinal 'ナ' = some 21 := by decide
example : kanaOrdinal 'ニ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ニ' := by decide
example : kanaOrdinal 'ニ' = some 4 := by decide
example : kanaOrdinal 'ヌ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ヌ' := by decide
example : kanaOrdinal 'ヌ' = some 10 := by decide
example : kanaOrdinal 'ネ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ネ' := by decide
example : kanaOrdinal 'ネ' = some 20 := by decide
example : kanaOrdinal 'ノ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ノ' := by decide
example : kanaOrdinal 'ノ' = some 26 := by decide
example : kanaOrdinal 'ハ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ハ' := by decide
example : kanaOrdinal 'ハ' = some 3 := by decide
example : kanaOrdinal 'ヘ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ヘ' := by decide
example : kanaOrdinal 'ヘ' = some 6 := by decide
example : kanaOrdinal 'ホ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ホ' := by decide
example : kanaOrdinal 'ホ' = some 5 := by decide
example : kanaOrdinal 'マ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'マ' := by decide
example : kanaOrdinal 'マ' = some 30 := by decide
example : kanaOrdinal 'ム' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ム' := by decide
example : kanaOrdinal 'ム' = some 23 := by decide
example : kanaOrdinal 'メ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'メ' := by decide
example : kanaOrdinal 'メ' = some 40 := by decide
example : kanaOrdinal 'モ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'モ' := by decide
example : kanaOrdinal 'モ' = some 45 := by decide
example : kanaOrdinal 'ヤ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ヤ' := by decide
example : kanaOrdinal 'ヤ' = some 29 := by decide
example : kanaOrdinal 'ヨ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ヨ' := by decide
example : kanaOrdinal 'ヨ' = some 15 := by decide
example : kanaOrdinal 'ラ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ラ' := by decide
example : kanaOrdinal 'ラ' = some 22 := by decide
example : kanaOrdinal 'ラ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ラ' := by decide
example : kanaOrdinal 'ラ' = some 22 := by decide
example : kanaOrdinal 'リ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'リ' := by decide
example : kanaOrdinal 'リ' = some 9 := by decide
example : kanaOrdinal 'ル' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ル' := by decide
example : kanaOrdinal 'ル' = some 11 := by decide
example : kanaOrdinal 'レ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'レ' := by decide
example : kanaOrdinal 'レ' = some 17 := by decide
example : kanaOrdinal 'ロ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ロ' := by decide
example : kanaOrdinal 'ロ' = some 2 := by decide
example : kanaOrdinal 'ロ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ロ' := by decide
example : kanaOrdinal 'ロ' = some 2 := by decide
example : kanaOrdinal 'ワ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ワ' := by decide
example : kanaOrdinal 'ワ' = some 13 := by decide
example : kanaOrdinal 'ヰ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ヰ' := by decide
example : kanaOrdinal 'ヰ' = some 25 := by decide
example : kanaOrdinal 'ヲ' = JapanTaxLaw.BareLabelFragmentsSpec.kanaOrdinalSpec 'ヲ' := by decide
example : kanaOrdinal 'ヲ' = some 12 := by decide
-- heading (structural declaration, content NOT MODELLED): （1）
-- heading (structural declaration, content NOT MODELLED): （2）
-- heading (structural declaration, content NOT MODELLED): （3）
-- heading (structural declaration, content NOT MODELLED): （ii）
-- heading (structural declaration, content NOT MODELLED): （i）
-- heading (structural declaration, content NOT MODELLED): （こうじの原料）
-- heading (structural declaration, content NOT MODELLED): （この法律の目的）
-- heading (structural declaration, content NOT MODELLED): （その他の手続）
-- heading (structural declaration, content NOT MODELLED): （その他の用語の定義）
-- heading (structural declaration, content NOT MODELLED): （その他の醸造酒の範囲）
-- heading (structural declaration, content NOT MODELLED): （たな卸表の作成）
-- heading (structural declaration, content NOT MODELLED): （たな卸資産の範囲等）
-- heading (structural declaration, content NOT MODELLED): （たな卸資産の範囲）
-- heading (structural declaration, content NOT MODELLED): （たばこ事業法等の特例）
-- heading (structural declaration, content NOT MODELLED): （たばこ税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （たばこ税の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （たばこ税の税率）
-- heading (structural declaration, content NOT MODELLED): （たばこ税の課税免除）
-- heading (structural declaration, content NOT MODELLED): （たばこ税の課税標準）
-- heading (structural declaration, content NOT MODELLED): （たばこ税の重加算金）
-- heading (structural declaration, content NOT MODELLED): （とん税法の規定の準用）
-- heading (structural declaration, content NOT MODELLED): （とん税法施行令の準用）
-- heading (structural declaration, content NOT MODELLED): （とん税等の免除手続）
-- heading (structural declaration, content NOT MODELLED): （とん税等の免除）
-- heading (structural declaration, content NOT MODELLED): （ひとり親の範囲）
-- heading (structural declaration, content NOT MODELLED): （ひとり親控除）
-- heading (structural declaration, content NOT MODELLED): （みなし揮発油等の特例）
-- heading (structural declaration, content NOT MODELLED): （みなし製造）
-- heading (structural declaration, content NOT MODELLED): （みなし輸入）
-- heading (structural declaration, content NOT MODELLED): （みりんに類似する酒類）
-- heading (structural declaration, content NOT MODELLED): （みりんの原料等）
-- heading (structural declaration, content NOT MODELLED): （コンテナーの封印）
-- heading (structural declaration, content NOT MODELLED): （コンテナーの承認手続）
-- heading (structural declaration, content NOT MODELLED): （ゴルフ場利用税の税率）
-- heading (structural declaration, content NOT MODELLED): （ビールに類似する酒類）
-- heading (structural declaration, content NOT MODELLED): （ビールの原料）
-- heading (structural declaration, content NOT MODELLED): （リース取引の範囲）
-- heading (structural declaration, content NOT MODELLED): （一括申告の手続）
-- heading (structural declaration, content NOT MODELLED): （一時所得）
-- heading (structural declaration, content NOT MODELLED): （一月当たりの給与の額）
-- heading (structural declaration, content NOT MODELLED): （一般の差押禁止財産）
-- heading (structural declaration, content NOT MODELLED): （一般の懲戒）
-- heading (structural declaration, content NOT MODELLED): （一般的監督）
-- heading (structural declaration, content NOT MODELLED): （一般的経過措置）
-- heading (structural declaration, content NOT MODELLED): （一）
-- heading (structural declaration, content NOT MODELLED): （七）
-- heading (structural declaration, content NOT MODELLED): （三月後の教示）
-- heading (structural declaration, content NOT MODELLED): （三）
-- heading (structural declaration, content NOT MODELLED): （不動産の価格の決定等）
-- heading (structural declaration, content NOT MODELLED): （不動産の売却決定期日）
-- heading (structural declaration, content NOT MODELLED): （不動産取得税の免税点）
-- heading (structural declaration, content NOT MODELLED): （不動産取得税の減免）
-- heading (structural declaration, content NOT MODELLED): （不動産取得税の減額等）
-- heading (structural declaration, content NOT MODELLED): （不動産取得税の税率）
-- heading (structural declaration, content NOT MODELLED): （不動産取得税の納期）
-- heading (structural declaration, content NOT MODELLED): （不動産取得税の非課税）
-- heading (structural declaration, content NOT MODELLED): （不動産所得）
-- heading (structural declaration, content NOT MODELLED): （不動産等の価額）
-- heading (structural declaration, content NOT MODELLED): （不動産等の売却決定）
-- heading (structural declaration, content NOT MODELLED): （不当廉売関税）
-- heading (structural declaration, content NOT MODELLED): （不服申立ての前置等）
-- heading (structural declaration, content NOT MODELLED): （不服申立ての取下げ）
-- heading (structural declaration, content NOT MODELLED): （不服申立て）
-- heading (structural declaration, content NOT MODELLED): （不服申立期間）
-- heading (structural declaration, content NOT MODELLED): （不納付加算税）
-- heading (structural declaration, content NOT MODELLED): （不足額の徴収）
-- heading (structural declaration, content NOT MODELLED): （不開港への出入）
-- heading (structural declaration, content NOT MODELLED): （両罰規定）
-- heading (structural declaration, content NOT MODELLED): （中央会）
-- heading (structural declaration, content NOT MODELLED): （中間申告による納付）
-- heading (structural declaration, content NOT MODELLED): （中間申告書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （中間申告）
-- heading (structural declaration, content NOT MODELLED): （中間納付額の還付）
-- heading (structural declaration, content NOT MODELLED): （乗用自動車の範囲）
-- heading (structural declaration, content NOT MODELLED): （予定納税基準額の計算）
-- heading (structural declaration, content NOT MODELLED): （予定納税額の徴収猶予）
-- heading (structural declaration, content NOT MODELLED): （予定納税額の納付）
-- heading (structural declaration, content NOT MODELLED): （予定納税額等の通知）
-- heading (structural declaration, content NOT MODELLED): （予定納税）
-- heading (structural declaration, content NOT MODELLED): （予算等）
-- heading (structural declaration, content NOT MODELLED): （予納税額の還付）
-- heading (structural declaration, content NOT MODELLED): （争訟の方式）
-- heading (structural declaration, content NOT MODELLED): （事前届出等）
-- heading (structural declaration, content NOT MODELLED): （事務の代理等）
-- heading (structural declaration, content NOT MODELLED): （事務の区分）
-- heading (structural declaration, content NOT MODELLED): （事務の委任）
-- heading (structural declaration, content NOT MODELLED): （事務所の設置）
-- heading (structural declaration, content NOT MODELLED): （事業の範囲）
-- heading (structural declaration, content NOT MODELLED): （事業の開廃等の届出）
-- heading (structural declaration, content NOT MODELLED): （事業主控除）
-- heading (structural declaration, content NOT MODELLED): （事業協同組合等の範囲）
-- heading (structural declaration, content NOT MODELLED): （事業年度の意義）
-- heading (structural declaration, content NOT MODELLED): （事業年度の特例）
-- heading (structural declaration, content NOT MODELLED): （事業年度）
-- heading (structural declaration, content NOT MODELLED): （事業所得）
-- heading (structural declaration, content NOT MODELLED): （事業所税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （事業所税の使途）
-- heading (structural declaration, content NOT MODELLED): （事業所税の免税点）
-- heading (structural declaration, content NOT MODELLED): （事業所税の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （事業所税の減免）
-- heading (structural declaration, content NOT MODELLED): （事業所税の納税管理人）
-- heading (structural declaration, content NOT MODELLED): （事業所税の課税標準）
-- heading (structural declaration, content NOT MODELLED): （事業所税の重加算金）
-- heading (structural declaration, content NOT MODELLED): （事業所税の非課税）
-- heading (structural declaration, content NOT MODELLED): （事業所税）
-- heading (structural declaration, content NOT MODELLED): （事業税と信託財産）
-- heading (structural declaration, content NOT MODELLED): （事業税に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （事業税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （事業税の納税管理人）
-- heading (structural declaration, content NOT MODELLED): （事業税の納税義務者等）
-- heading (structural declaration, content NOT MODELLED): （事業税の経過措置）
-- heading (structural declaration, content NOT MODELLED): （事業税の非課税の範囲）
-- heading (structural declaration, content NOT MODELLED): （事業税の非課税）
-- heading (structural declaration, content NOT MODELLED): （事業者等への協力要請）
-- heading (structural declaration, content NOT MODELLED): （事業関連性の判定）
-- heading (structural declaration, content NOT MODELLED): （事業）
-- heading (structural declaration, content NOT MODELLED): （二）
-- heading (structural declaration, content NOT MODELLED): （五）
-- heading (structural declaration, content NOT MODELLED): （亡失及び滅却の届出）
-- heading (structural declaration, content NOT MODELLED): （亡失証明書の交付手続）
-- heading (structural declaration, content NOT MODELLED): （交付の求め等）
-- heading (structural declaration, content NOT MODELLED): （交付時期）
-- heading (structural declaration, content NOT MODELLED): （交付税の種類等）
-- heading (structural declaration, content NOT MODELLED): （交付税の総額）
-- heading (structural declaration, content NOT MODELLED): （交付税の額の算定期日）
-- heading (structural declaration, content NOT MODELLED): （交付要求の制限）
-- heading (structural declaration, content NOT MODELLED): （交付要求の手続）
-- heading (structural declaration, content NOT MODELLED): （交付要求の解除の請求）
-- heading (structural declaration, content NOT MODELLED): （交付要求の解除）
-- heading (structural declaration, content NOT MODELLED): （交付送達の手続）
-- heading (structural declaration, content NOT MODELLED): （交付金の交付の申請）
-- heading (structural declaration, content NOT MODELLED): （交付金の交付手続）
-- heading (structural declaration, content NOT MODELLED): （交付金の交付）
-- heading (structural declaration, content NOT MODELLED): （交付金銭等の支払調書）
-- heading (structural declaration, content NOT MODELLED): （交付額の特例）
-- heading (structural declaration, content NOT MODELLED): （交換事務取扱手続）
-- heading (structural declaration, content NOT MODELLED): （交換手数料）
-- heading (structural declaration, content NOT MODELLED): （交換期間）
-- heading (structural declaration, content NOT MODELLED): （交際費等の損金不算入）
-- heading (structural declaration, content NOT MODELLED): （交際費等の範囲）
-- heading (structural declaration, content NOT MODELLED): （今次の税制改革の方針）
-- heading (structural declaration, content NOT MODELLED): （今次の税制改革の趣旨）
-- heading (structural declaration, content NOT MODELLED): （他の法律の廃止）
-- heading (structural declaration, content NOT MODELLED): （他の省令の廃止）
-- heading (structural declaration, content NOT MODELLED): （付加税の禁止）
-- heading (structural declaration, content NOT MODELLED): （代理人）
-- heading (structural declaration, content NOT MODELLED): （代行機関の通知）
-- heading (structural declaration, content NOT MODELLED): （代表権の制限）
-- heading (structural declaration, content NOT MODELLED): （代表者会議の権限）
-- heading (structural declaration, content NOT MODELLED): （代表者会議の議長）
-- heading (structural declaration, content NOT MODELLED): （代表者等の自署押印）
-- heading (structural declaration, content NOT MODELLED): （仮の決定の告示）
-- heading (structural declaration, content NOT MODELLED): （仮の決定の通知等）
-- heading (structural declaration, content NOT MODELLED): （任意脱退）
-- heading (structural declaration, content NOT MODELLED): （企業グループ等の範囲）
-- heading (structural declaration, content NOT MODELLED): （企業組合等の分配金）
-- heading (structural declaration, content NOT MODELLED): （休業又は廃業の届出）
-- heading (structural declaration, content NOT MODELLED): （会則を守る義務）
-- heading (structural declaration, content NOT MODELLED): （会員の異動の通知）
-- heading (structural declaration, content NOT MODELLED): （会員名簿）
-- heading (structural declaration, content NOT MODELLED): （会計に関する事務）
-- heading (structural declaration, content NOT MODELLED): （会計帳簿等の閲覧等）
-- heading (structural declaration, content NOT MODELLED): （会計帳簿）
-- heading (structural declaration, content NOT MODELLED): （会計規程）
-- heading (structural declaration, content NOT MODELLED): （会長）
-- heading (structural declaration, content NOT MODELLED): （住所変更の場合の特例）
-- heading (structural declaration, content NOT MODELLED): （住民基本台帳法関係）
-- heading (structural declaration, content NOT MODELLED): （併合審理等）
-- heading (structural declaration, content NOT MODELLED): （使用料及び手数料）
-- heading (structural declaration, content NOT MODELLED): （使用状況の報告等）
-- heading (structural declaration, content NOT MODELLED): （使用状況の報告）
-- heading (structural declaration, content NOT MODELLED): （供託）
-- heading (structural declaration, content NOT MODELLED): （価格の表示）
-- heading (structural declaration, content NOT MODELLED): （便益関税の税率）
-- heading (structural declaration, content NOT MODELLED): （便益関税を適用する国）
-- heading (structural declaration, content NOT MODELLED): （便益関税）
-- heading (structural declaration, content NOT MODELLED): （保全差押え）
-- heading (structural declaration, content NOT MODELLED): （保全差押に関する手続）
-- heading (structural declaration, content NOT MODELLED): （保全担保）
-- heading (structural declaration, content NOT MODELLED): （保存書類）
-- heading (structural declaration, content NOT MODELLED): （保存酒の変換等）
-- heading (structural declaration, content NOT MODELLED): （保存酒類の処分禁止）
-- heading (structural declaration, content NOT MODELLED): （保税作業の届出）
-- heading (structural declaration, content NOT MODELLED): （保税地域の種類）
-- heading (structural declaration, content NOT MODELLED): （保税展示場の許可）
-- heading (structural declaration, content NOT MODELLED): （保税工場の許可の特例）
-- heading (structural declaration, content NOT MODELLED): （保税工場の許可手数料）
-- heading (structural declaration, content NOT MODELLED): （保税工場の許可）
-- heading (structural declaration, content NOT MODELLED): （保税蔵置場の許可）
-- heading (structural declaration, content NOT MODELLED): （保税運送の手続）
-- heading (structural declaration, content NOT MODELLED): （保税運送の特例）
-- heading (structural declaration, content NOT MODELLED): （保税運送）
-- heading (structural declaration, content NOT MODELLED): （保管現金の亡失）
-- heading (structural declaration, content NOT MODELLED): （保証団体の認可等）
-- heading (structural declaration, content NOT MODELLED): （保証団体）
-- heading (structural declaration, content NOT MODELLED): （保険金等の範囲）
-- heading (structural declaration, content NOT MODELLED): （信用保証協会法関係）
-- heading (structural declaration, content NOT MODELLED): （信用失墜行為の禁止）
-- heading (structural declaration, content NOT MODELLED): （信用金庫法関係）
-- heading (structural declaration, content NOT MODELLED): （信託に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （信託の変更をする権限）
-- heading (structural declaration, content NOT MODELLED): （信託の計算書）
-- heading (structural declaration, content NOT MODELLED): （信託業法関係等）
-- heading (structural declaration, content NOT MODELLED): （信託財産の範囲）
-- heading (structural declaration, content NOT MODELLED): （修正申告の効力）
-- heading (structural declaration, content NOT MODELLED): （修正申告の手続）
-- heading (structural declaration, content NOT MODELLED): （修正申告の特例）
-- heading (structural declaration, content NOT MODELLED): （修正申告の特則）
-- heading (structural declaration, content NOT MODELLED): （修正申告書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （修正申告等の効力）
-- heading (structural declaration, content NOT MODELLED): （修正申告）
-- heading (structural declaration, content NOT MODELLED): （修理等の処分）
-- heading (structural declaration, content NOT MODELLED): （個人の事業税の減免）
-- heading (structural declaration, content NOT MODELLED): （個人の事業税の納期）
-- heading (structural declaration, content NOT MODELLED): （個人の均等割の税率）
-- heading (structural declaration, content NOT MODELLED): （個人の納税地の特例）
-- heading (structural declaration, content NOT MODELLED): （個人の納税地）
-- heading (structural declaration, content NOT MODELLED): （個人事業者の納税地）
-- heading (structural declaration, content NOT MODELLED): （借地権の申告手続）
-- heading (structural declaration, content NOT MODELLED): （借地権等の範囲）
-- heading (structural declaration, content NOT MODELLED): （備考）
-- heading (structural declaration, content NOT MODELLED): （債務控除）
-- heading (structural declaration, content NOT MODELLED): （債権の個数の算定方法）
-- heading (structural declaration, content NOT MODELLED): （債権の申出の催告等）
-- heading (structural declaration, content NOT MODELLED): （債権者の異議等）
-- heading (structural declaration, content NOT MODELLED): （債権者の異議）
-- heading (structural declaration, content NOT MODELLED): （債権者への通知等）
-- heading (structural declaration, content NOT MODELLED): （債権証書の取上げ）
-- heading (structural declaration, content NOT MODELLED): （債権額の確認方法）
-- heading (structural declaration, content NOT MODELLED): （償却超過額の処理）
-- heading (structural declaration, content NOT MODELLED): （償還差益の金額等）
-- heading (structural declaration, content NOT MODELLED): （優先質権等の証明手続）
-- heading (structural declaration, content NOT MODELLED): （元売業者の指定）
-- heading (structural declaration, content NOT MODELLED): （充当等の特例）
-- heading (structural declaration, content NOT MODELLED): （充当）
-- heading (structural declaration, content NOT MODELLED): （免税に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （免税の申請）
-- heading (structural declaration, content NOT MODELLED): （免税対象車等の範囲）
-- heading (structural declaration, content NOT MODELLED): （免税物品の範囲）
-- heading (structural declaration, content NOT MODELLED): （免税物品の譲受手続）
-- heading (structural declaration, content NOT MODELLED): （免税物品の譲渡の制限）
-- heading (structural declaration, content NOT MODELLED): （免税物品の譲渡手続）
-- heading (structural declaration, content NOT MODELLED): （免税物品の譲渡禁止等）
-- heading (structural declaration, content NOT MODELLED): （免税等）
-- heading (structural declaration, content NOT MODELLED): （免税証の受取義務）
-- heading (structural declaration, content NOT MODELLED): （免税証の譲渡の禁止）
-- heading (structural declaration, content NOT MODELLED): （免許等の範囲）
-- heading (structural declaration, content NOT MODELLED): （免除の申請手続）
-- heading (structural declaration, content NOT MODELLED): （免除の額）
-- heading (structural declaration, content NOT MODELLED): （免除）
-- heading (structural declaration, content NOT MODELLED): （児童福祉施設等の指定）
-- heading (structural declaration, content NOT MODELLED): （入会及び退会等）
-- heading (structural declaration, content NOT MODELLED): （入出港の簡易手続）
-- heading (structural declaration, content NOT MODELLED): （入出港手続の免除）
-- heading (structural declaration, content NOT MODELLED): （入札及び開札）
-- heading (structural declaration, content NOT MODELLED): （入港手続）
-- heading (structural declaration, content NOT MODELLED): （入湯税に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （入湯税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （入湯税の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （入湯税の税率）
-- heading (structural declaration, content NOT MODELLED): （入湯税）
-- heading (structural declaration, content NOT MODELLED): （八）
-- heading (structural declaration, content NOT MODELLED): （公債発行の特例）
-- heading (structural declaration, content NOT MODELLED): （公共法人等の事業年度）
-- heading (structural declaration, content NOT MODELLED): （公募の要件）
-- heading (structural declaration, content NOT MODELLED): （公募等による投資信託）
-- heading (structural declaration, content NOT MODELLED): （公告の方法）
-- heading (structural declaration, content NOT MODELLED): （公売の公告）
-- heading (structural declaration, content NOT MODELLED): （公売の場所）
-- heading (structural declaration, content NOT MODELLED): （公売の通知）
-- heading (structural declaration, content NOT MODELLED): （公売保証金）
-- heading (structural declaration, content NOT MODELLED): （公売公告）
-- heading (structural declaration, content NOT MODELLED): （公売参加者の制限）
-- heading (structural declaration, content NOT MODELLED): （公売）
-- heading (structural declaration, content NOT MODELLED): （公正な取引の基準）
-- heading (structural declaration, content NOT MODELLED): （公的年金等の月割額）
-- heading (structural declaration, content NOT MODELLED): （公示送達の方法）
-- heading (structural declaration, content NOT MODELLED): （公示送達）
-- heading (structural declaration, content NOT MODELLED): （公社債等の範囲）
-- heading (structural declaration, content NOT MODELLED): （公聴会）
-- heading (structural declaration, content NOT MODELLED): （公職選挙法関係）
-- heading (structural declaration, content NOT MODELLED): （公表）
-- heading (structural declaration, content NOT MODELLED): （六月の期間の特例）
-- heading (structural declaration, content NOT MODELLED): （六）
-- heading (structural declaration, content NOT MODELLED): （共同利用施設の要件）
-- heading (structural declaration, content NOT MODELLED): （共同支配会社等の範囲）
-- heading (structural declaration, content NOT MODELLED): （共同施設税）
-- heading (structural declaration, content NOT MODELLED): （内国法人の納税地）
-- heading (structural declaration, content NOT MODELLED): （内国消費税の免除）
-- heading (structural declaration, content NOT MODELLED): （内国貨物の使用等）
-- heading (structural declaration, content NOT MODELLED): （内国貨物の運送の手続）
-- heading (structural declaration, content NOT MODELLED): （内国貨物の運送）
-- heading (structural declaration, content NOT MODELLED): （内部取引に関する書類）
-- heading (structural declaration, content NOT MODELLED): （内閣府令等への委任）
-- heading (structural declaration, content NOT MODELLED): （再公売）
-- heading (structural declaration, content NOT MODELLED): （再就職者等の給与等）
-- heading (structural declaration, content NOT MODELLED): （再度入札）
-- heading (structural declaration, content NOT MODELLED): （再更正）
-- heading (structural declaration, content NOT MODELLED): （再調査の請求）
-- heading (structural declaration, content NOT MODELLED): （再輸入減税）
-- heading (structural declaration, content NOT MODELLED): （再輸出の届出の省略）
-- heading (structural declaration, content NOT MODELLED): （再輸出免税）
-- heading (structural declaration, content NOT MODELLED): （再輸出期間）
-- heading (structural declaration, content NOT MODELLED): （再輸出減税）
-- heading (structural declaration, content NOT MODELLED): （処分の効力の承継等）
-- heading (structural declaration, content NOT MODELLED): （処分中の出入りの禁止）
-- heading (structural declaration, content NOT MODELLED): （処分等の効力）
-- heading (structural declaration, content NOT MODELLED): （処分通知等の指定）
-- heading (structural declaration, content NOT MODELLED): （出入禁止）
-- heading (structural declaration, content NOT MODELLED): （出港手続）
-- heading (structural declaration, content NOT MODELLED): （出納計算書の調査）
-- heading (structural declaration, content NOT MODELLED): （出納計算書）
-- heading (structural declaration, content NOT MODELLED): （分割法人の申告納付等）
-- heading (structural declaration, content NOT MODELLED): （分科会）
-- heading (structural declaration, content NOT MODELLED): （分納金額の調査決定）
-- heading (structural declaration, content NOT MODELLED): （別に定める経過措置）
-- heading (structural declaration, content NOT MODELLED): （別送貨物の指定）
-- heading (structural declaration, content NOT MODELLED): （利子割に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （利子割に係る督促）
-- heading (structural declaration, content NOT MODELLED): （利子割の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （利子割の清算の時期等）
-- heading (structural declaration, content NOT MODELLED): （利子割の税率）
-- heading (structural declaration, content NOT MODELLED): （利子割の課税標準）
-- heading (structural declaration, content NOT MODELLED): （利子所得の分離課税等）
-- heading (structural declaration, content NOT MODELLED): （利子所得）
-- heading (structural declaration, content NOT MODELLED): （利子税の割合の特例）
-- heading (structural declaration, content NOT MODELLED): （利子税等の額の計算）
-- heading (structural declaration, content NOT MODELLED): （利子税）
-- heading (structural declaration, content NOT MODELLED): （利子等の支払調書）
-- heading (structural declaration, content NOT MODELLED): （利益積立金額）
-- heading (structural declaration, content NOT MODELLED): （剰余金処理の特例）
-- heading (structural declaration, content NOT MODELLED): （割当ての方法及び基準）
-- heading (structural declaration, content NOT MODELLED): （創立総会の議事録）
-- heading (structural declaration, content NOT MODELLED): （創立総会）
-- heading (structural declaration, content NOT MODELLED): （加入の時期）
-- heading (structural declaration, content NOT MODELLED): （加入の自由）
-- heading (structural declaration, content NOT MODELLED): （加工又は修繕の指定）
-- heading (structural declaration, content NOT MODELLED): （加算税の税目）
-- heading (structural declaration, content NOT MODELLED): （助言義務）
-- heading (structural declaration, content NOT MODELLED): （労働金庫法関係）
-- heading (structural declaration, content NOT MODELLED): （動産等の売却決定）
-- heading (structural declaration, content NOT MODELLED): （動産等の引渡し）
-- heading (structural declaration, content NOT MODELLED): （勤労学生の範囲）
-- heading (structural declaration, content NOT MODELLED): （勤労学生控除）
-- heading (structural declaration, content NOT MODELLED): （勤続年数の計算）
-- heading (structural declaration, content NOT MODELLED): （医療費の範囲）
-- heading (structural declaration, content NOT MODELLED): （医療費控除）
-- heading (structural declaration, content NOT MODELLED): （匿名組合契約等の範囲）
-- heading (structural declaration, content NOT MODELLED): （協定の変更命令等）
-- heading (structural declaration, content NOT MODELLED): （協定の実施の予告）
-- heading (structural declaration, content NOT MODELLED): （協定の廃止の届出）
-- heading (structural declaration, content NOT MODELLED): （協定の廃止）
-- heading (structural declaration, content NOT MODELLED): （協定の設定及び変更）
-- heading (structural declaration, content NOT MODELLED): （協定の設定等の公告）
-- heading (structural declaration, content NOT MODELLED): （協定の設定等の届出）
-- heading (structural declaration, content NOT MODELLED): （単式蒸留焼酎の原料等）
-- heading (structural declaration, content NOT MODELLED): （単式蒸留焼酎の原料）
-- heading (structural declaration, content NOT MODELLED): （博覧会等の指定）
-- heading (structural declaration, content NOT MODELLED): （印紙による納付等）
-- heading (structural declaration, content NOT MODELLED): （印紙の亡失等の報告）
-- heading (structural declaration, content NOT MODELLED): （印紙の交付）
-- heading (structural declaration, content NOT MODELLED): （印紙の交換等）
-- heading (structural declaration, content NOT MODELLED): （印紙の交換）
-- heading (structural declaration, content NOT MODELLED): （印紙の受領書の提出）
-- heading (structural declaration, content NOT MODELLED): （印紙の管理方法）
-- heading (structural declaration, content NOT MODELLED): （印紙を消す方法）
-- heading (structural declaration, content NOT MODELLED): （印紙代金の納付等）
-- heading (structural declaration, content NOT MODELLED): （印紙税の非課税）
-- heading (structural declaration, content NOT MODELLED): （印紙税法の特例）
-- heading (structural declaration, content NOT MODELLED): （印紙納付ができる場合）
-- heading (structural declaration, content NOT MODELLED): （印紙納付）
-- heading (structural declaration, content NOT MODELLED): （印鑑の照合等）
-- heading (structural declaration, content NOT MODELLED): （厚生労働省令への委任）
-- heading (structural declaration, content NOT MODELLED): （原則）
-- heading (structural declaration, content NOT MODELLED): （原子燃料公社の解散等）
-- heading (structural declaration, content NOT MODELLED): （原産地の意義）
-- heading (structural declaration, content NOT MODELLED): （原産地の証明）
-- heading (structural declaration, content NOT MODELLED): （原産地証明書の提出）
-- heading (structural declaration, content NOT MODELLED): （原産地証明書等の様式）
-- heading (structural declaration, content NOT MODELLED): （参加人）
-- heading (structural declaration, content NOT MODELLED): （参加差押えの効力）
-- heading (structural declaration, content NOT MODELLED): （参加差押えの手続）
-- heading (structural declaration, content NOT MODELLED): （双方居住者の取扱い）
-- heading (structural declaration, content NOT MODELLED): （双方居住者の範囲）
-- heading (structural declaration, content NOT MODELLED): （反論書等の提出）
-- heading (structural declaration, content NOT MODELLED): （収入金額）
-- heading (structural declaration, content NOT MODELLED): （収去酒類等の非課税）
-- heading (structural declaration, content NOT MODELLED): （収容に要した費用）
-- heading (structural declaration, content NOT MODELLED): （収容の公告）
-- heading (structural declaration, content NOT MODELLED): （収容の効力）
-- heading (structural declaration, content NOT MODELLED): （収容の方法）
-- heading (structural declaration, content NOT MODELLED): （収容の解除）
-- heading (structural declaration, content NOT MODELLED): （収容課金）
-- heading (structural declaration, content NOT MODELLED): （収容貨物の廃棄の公告）
-- heading (structural declaration, content NOT MODELLED): （収益事業の範囲）
-- heading (structural declaration, content NOT MODELLED): （収納の特例）
-- heading (structural declaration, content NOT MODELLED): （収納未済額の登記）
-- heading (structural declaration, content NOT MODELLED): （収納済額の登記）
-- heading (structural declaration, content NOT MODELLED): （取卸しとみなす場合）
-- heading (structural declaration, content NOT MODELLED): （取引の記録等）
-- heading (structural declaration, content NOT MODELLED): （取引店）
-- heading (structural declaration, content NOT MODELLED): （取替資産の範囲）
-- heading (structural declaration, content NOT MODELLED): （受入金の訂正）
-- heading (structural declaration, content NOT MODELLED): （受益者連続型信託）
-- heading (structural declaration, content NOT MODELLED): （受託者の変更の届出）
-- heading (structural declaration, content NOT MODELLED): （受託者の範囲）
-- heading (structural declaration, content NOT MODELLED): （受験手数料等）
-- heading (structural declaration, content NOT MODELLED): （受験資格の特例）
-- heading (structural declaration, content NOT MODELLED): （受験資格の認定の申請）
-- heading (structural declaration, content NOT MODELLED): （受験資格）
-- heading (structural declaration, content NOT MODELLED): （受験願書）
-- heading (structural declaration, content NOT MODELLED): （口頭意見陳述）
-- heading (structural declaration, content NOT MODELLED): （各相続人等の相続税額）
-- heading (structural declaration, content NOT MODELLED): （各種投資会社等の範囲）
-- heading (structural declaration, content NOT MODELLED): （合併の時期）
-- heading (structural declaration, content NOT MODELLED): （合併の無効の訴え）
-- heading (structural declaration, content NOT MODELLED): （合併の登記）
-- heading (structural declaration, content NOT MODELLED): （合併及び解散）
-- heading (structural declaration, content NOT MODELLED): （合併）
-- heading (structural declaration, content NOT MODELLED): （合成清酒の原料等）
-- heading (structural declaration, content NOT MODELLED): （合格の取消し等）
-- heading (structural declaration, content NOT MODELLED): （合格の基準）
-- heading (structural declaration, content NOT MODELLED): （合格証書等）
-- heading (structural declaration, content NOT MODELLED): （合衆国の租税の徴収）
-- heading (structural declaration, content NOT MODELLED): （合議体）
-- heading (structural declaration, content NOT MODELLED): （同族関係者の範囲等）
-- heading (structural declaration, content NOT MODELLED): （同族関係者の範囲）
-- heading (structural declaration, content NOT MODELLED): （名称の使用制限）
-- heading (structural declaration, content NOT MODELLED): （名称の承認の申請）
-- heading (structural declaration, content NOT MODELLED): （名称使用の制限）
-- heading (structural declaration, content NOT MODELLED): （名称）
-- heading (structural declaration, content NOT MODELLED): （告知に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （命令への委任）
-- heading (structural declaration, content NOT MODELLED): （品目の例外表示）
-- heading (structural declaration, content NOT MODELLED): （商品券取締法関係）
-- heading (structural declaration, content NOT MODELLED): （商業登記法の準用）
-- heading (structural declaration, content NOT MODELLED): （営業の開廃等の報告）
-- heading (structural declaration, content NOT MODELLED): （四）
-- heading (structural declaration, content NOT MODELLED): （固定資産の実地調査）
-- heading (structural declaration, content NOT MODELLED): （固定資産の申告）
-- heading (structural declaration, content NOT MODELLED): （固定資産の範囲）
-- heading (structural declaration, content NOT MODELLED): （固定資産の評価）
-- heading (structural declaration, content NOT MODELLED): （固定資産税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （固定資産税の免税点）
-- heading (structural declaration, content NOT MODELLED): （固定資産税の減免）
-- heading (structural declaration, content NOT MODELLED): （固定資産税の税率）
-- heading (structural declaration, content NOT MODELLED): （固定資産税の納期）
-- heading (structural declaration, content NOT MODELLED): （固定資産税の賦課期日）
-- heading (structural declaration, content NOT MODELLED): （固定資産税等の非課税）
-- heading (structural declaration, content NOT MODELLED): （固定資産評価員の設置）
-- heading (structural declaration, content NOT MODELLED): （固定資産評価補助員）
-- heading (structural declaration, content NOT MODELLED): （国による買入れ）
-- heading (structural declaration, content NOT MODELLED): （国内に源泉がある所得）
-- heading (structural declaration, content NOT MODELLED): （国内事業所等の範囲）
-- heading (structural declaration, content NOT MODELLED): （国内消費量の算出方法）
-- heading (structural declaration, content NOT MODELLED): （国内消費量の統計）
-- heading (structural declaration, content NOT MODELLED): （国内源泉所得）
-- heading (structural declaration, content NOT MODELLED): （国外に源泉がある所得）
-- heading (structural declaration, content NOT MODELLED): （国外事業者の納税地）
-- heading (structural declaration, content NOT MODELLED): （国外所得金額）
-- heading (structural declaration, content NOT MODELLED): （国外財産調書の提出）
-- heading (structural declaration, content NOT MODELLED): （国外送金等調書の提出）
-- heading (structural declaration, content NOT MODELLED): （国庫補助金等の範囲）
-- heading (structural declaration, content NOT MODELLED): （国庫金振替書の発行）
-- heading (structural declaration, content NOT MODELLED): （国有の財産の譲与等）
-- heading (structural declaration, content NOT MODELLED): （国民健康保険税の減額）
-- heading (structural declaration, content NOT MODELLED): （国民健康保険税）
-- heading (structural declaration, content NOT MODELLED): （国税に関する相殺）
-- heading (structural declaration, content NOT MODELLED): （国税の徴収の共助）
-- heading (structural declaration, content NOT MODELLED): （国税の徴収の所轄庁）
-- heading (structural declaration, content NOT MODELLED): （国税不服審判所）
-- heading (structural declaration, content NOT MODELLED): （国税優先の原則）
-- heading (structural declaration, content NOT MODELLED): （国税収納命令官）
-- heading (structural declaration, content NOT MODELLED): （国税収納官吏等）
-- heading (structural declaration, content NOT MODELLED): （国税審判官の資格）
-- heading (structural declaration, content NOT MODELLED): （国税審判官等の定数）
-- heading (structural declaration, content NOT MODELLED): （国税審判官等）
-- heading (structural declaration, content NOT MODELLED): （国税審査官）
-- heading (structural declaration, content NOT MODELLED): （国税審議会への諮問）
-- heading (structural declaration, content NOT MODELLED): （国税徴収法の準用）
-- heading (structural declaration, content NOT MODELLED): （国税徴収法の適用）
-- heading (structural declaration, content NOT MODELLED): （国税犯則取締法の適用）
-- heading (structural declaration, content NOT MODELLED): （国税相当琉球政府税等）
-- heading (structural declaration, content NOT MODELLED): （国税等の徴収及び収納）
-- heading (structural declaration, content NOT MODELLED): （国税資金支払命令官）
-- heading (structural declaration, content NOT MODELLED): （国税通則法等の特例）
-- heading (structural declaration, content NOT MODELLED): （国等の事務）
-- heading (structural declaration, content NOT MODELLED): （国際機関の範囲）
-- heading (structural declaration, content NOT MODELLED): （国際海運業所得）
-- heading (structural declaration, content NOT MODELLED): （国際観光旅客等の範囲）
-- heading (structural declaration, content NOT MODELLED): （国際運輸業所得）
-- heading (structural declaration, content NOT MODELLED): （土地評価審議会）
-- heading (structural declaration, content NOT MODELLED): （地価税の課税の停止）
-- heading (structural declaration, content NOT MODELLED): （地区の承認の申請）
-- heading (structural declaration, content NOT MODELLED): （地区の重複禁止）
-- heading (structural declaration, content NOT MODELLED): （地方公務員法関係）
-- heading (structural declaration, content NOT MODELLED): （地方公営企業法関係）
-- heading (structural declaration, content NOT MODELLED): （地方団体の課税権）
-- heading (structural declaration, content NOT MODELLED): （地方揮発油譲与税）
-- heading (structural declaration, content NOT MODELLED): （地方法人税控除限度額）
-- heading (structural declaration, content NOT MODELLED): （地方消費税の使途）
-- heading (structural declaration, content NOT MODELLED): （地方消費税の清算）
-- heading (structural declaration, content NOT MODELLED): （地方消費税の税率）
-- heading (structural declaration, content NOT MODELLED): （地方税に関する相殺）
-- heading (structural declaration, content NOT MODELLED): （地方税の消滅時効）
-- heading (structural declaration, content NOT MODELLED): （地方税優先の原則）
-- heading (structural declaration, content NOT MODELLED): （地方税控除限度額）
-- heading (structural declaration, content NOT MODELLED): （地方税法の一部改正等）
-- heading (structural declaration, content NOT MODELLED): （地方税法の一部改正）
-- heading (structural declaration, content NOT MODELLED): （地方税法の特例）
-- heading (structural declaration, content NOT MODELLED): （地方税関係通知の特例）
-- heading (structural declaration, content NOT MODELLED): （地方自治法関係）
-- heading (structural declaration, content NOT MODELLED): （地方道路譲与税法関係）
-- heading (structural declaration, content NOT MODELLED): （地震保険料控除）
-- heading (structural declaration, content NOT MODELLED): （型式承認の効力）
-- heading (structural declaration, content NOT MODELLED): （基準法人税額等）
-- heading (structural declaration, content NOT MODELLED): （基準法人税額）
-- heading (structural declaration, content NOT MODELLED): （基準販売価格）
-- heading (structural declaration, content NOT MODELLED): （基礎控除）
-- heading (structural declaration, content NOT MODELLED): （報告の徴取及び検査）
-- heading (structural declaration, content NOT MODELLED): （報告及び立入検査）
-- heading (structural declaration, content NOT MODELLED): （報告書の作成方法）
-- heading (structural declaration, content NOT MODELLED): （報告書の公表）
-- heading (structural declaration, content NOT MODELLED): （報告）
-- heading (structural declaration, content NOT MODELLED): （報復関税等）
-- heading (structural declaration, content NOT MODELLED): （報酬のある公職）
-- heading (structural declaration, content NOT MODELLED): （増加償却割合の計算等）
-- heading (structural declaration, content NOT MODELLED): （増加償却割合の計算）
-- heading (structural declaration, content NOT MODELLED): （売却決定通知書の交付）
-- heading (structural declaration, content NOT MODELLED): （売却決定通知書）
-- heading (structural declaration, content NOT MODELLED): （変動所得の範囲）
-- heading (structural declaration, content NOT MODELLED): （変更の登記の申請）
-- heading (structural declaration, content NOT MODELLED): （変更の登記）
-- heading (structural declaration, content NOT MODELLED): （変更の登録の申請）
-- heading (structural declaration, content NOT MODELLED): （変更登録）
-- heading (structural declaration, content NOT MODELLED): （変質等による減税手続）
-- heading (structural declaration, content NOT MODELLED): （外交官用貨物等の免税）
-- heading (structural declaration, content NOT MODELLED): （外国とみなす地域）
-- heading (structural declaration, content NOT MODELLED): （外国の指定等）
-- heading (structural declaration, content NOT MODELLED): （外国の指定）
-- heading (structural declaration, content NOT MODELLED): （外国公館等の非課税）
-- heading (structural declaration, content NOT MODELLED): （外国子会社の要件等）
-- heading (structural declaration, content NOT MODELLED): （外国居住者等の範囲）
-- heading (structural declaration, content NOT MODELLED): （外国所得税の範囲）
-- heading (structural declaration, content NOT MODELLED): （外国法人の納税地）
-- heading (structural declaration, content NOT MODELLED): （外国法人税の範囲）
-- heading (structural declaration, content NOT MODELLED): （外国税額の控除）
-- heading (structural declaration, content NOT MODELLED): （外国税額の還付の手続）
-- heading (structural declaration, content NOT MODELLED): （外国税額の還付）
-- heading (structural declaration, content NOT MODELLED): （外国税額控除等の特例）
-- heading (structural declaration, content NOT MODELLED): （外国税額控除）
-- heading (structural declaration, content NOT MODELLED): （外国貨物に係る納税地）
-- heading (structural declaration, content NOT MODELLED): （外国貨物の仮陸揚）
-- heading (structural declaration, content NOT MODELLED): （外国貨物の廃棄の届出）
-- heading (structural declaration, content NOT MODELLED): （外国貨物の廃棄）
-- heading (structural declaration, content NOT MODELLED): （外国貨物の搬入停止等）
-- heading (structural declaration, content NOT MODELLED): （外国貿易機の入港手続）
-- heading (structural declaration, content NOT MODELLED): （外国貿易船の入港手続）
-- heading (structural declaration, content NOT MODELLED): （外国送金の手続）
-- heading (structural declaration, content NOT MODELLED): （外国関係会社の判定等）
-- heading (structural declaration, content NOT MODELLED): （外国関係会社の範囲）
-- heading (structural declaration, content NOT MODELLED): （外貨建取引の換算）
-- heading (structural declaration, content NOT MODELLED): （外貨建有価証券）
-- heading (structural declaration, content NOT MODELLED): （奄美群島税法の租税）
-- heading (structural declaration, content NOT MODELLED): （奄美群島税法）
-- heading (structural declaration, content NOT MODELLED): （契約締結時等の範囲）
-- heading (structural declaration, content NOT MODELLED): （委員の任命）
-- heading (structural declaration, content NOT MODELLED): （委員の任期等）
-- heading (structural declaration, content NOT MODELLED): （委員等の任命）
-- heading (structural declaration, content NOT MODELLED): （委託契約書の作成）
-- heading (structural declaration, content NOT MODELLED): （宅地開発税）
-- heading (structural declaration, content NOT MODELLED): （守秘義務）
-- heading (structural declaration, content NOT MODELLED): （安定財源の確保の方針）
-- heading (structural declaration, content NOT MODELLED): （完全支配関係）
-- heading (structural declaration, content NOT MODELLED): （宗教用寄贈物品の指定）
-- heading (structural declaration, content NOT MODELLED): （官公署等への協力要請）
-- heading (structural declaration, content NOT MODELLED): （定期同額給与の範囲等）
-- heading (structural declaration, content NOT MODELLED): （定款に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （定款の変更）
-- heading (structural declaration, content NOT MODELLED): （定款）
-- heading (structural declaration, content NOT MODELLED): （定義に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （定義等）
-- heading (structural declaration, content NOT MODELLED): （定義）
-- heading (structural declaration, content NOT MODELLED): （実施場所）
-- heading (structural declaration, content NOT MODELLED): （実施規則の記載事項）
-- heading (structural declaration, content NOT MODELLED): （実施規定）
-- heading (structural declaration, content NOT MODELLED): （実質所得者課税の原則）
-- heading (structural declaration, content NOT MODELLED): （実質支配関係の判定）
-- heading (structural declaration, content NOT MODELLED): （家事関連費）
-- heading (structural declaration, content NOT MODELLED): （寄贈物品の免税の手続）
-- heading (structural declaration, content NOT MODELLED): （寄附金の損金不算入）
-- heading (structural declaration, content NOT MODELLED): （寄附金控除）
-- heading (structural declaration, content NOT MODELLED): （寄附金税額控除）
-- heading (structural declaration, content NOT MODELLED): （寡婦の範囲）
-- heading (structural declaration, content NOT MODELLED): （寡婦控除）
-- heading (structural declaration, content NOT MODELLED): （審査請求の理由の制限）
-- heading (structural declaration, content NOT MODELLED): （審査請求書の補正）
-- heading (structural declaration, content NOT MODELLED): （審査請求書の送付）
-- heading (structural declaration, content NOT MODELLED): （審査請求期間の特例）
-- heading (structural declaration, content NOT MODELLED): （審理手続の終結）
-- heading (structural declaration, content NOT MODELLED): （審理手続の計画的進行）
-- heading (structural declaration, content NOT MODELLED): （審理手続の計画的遂行）
-- heading (structural declaration, content NOT MODELLED): （審議会等への諮問）
-- heading (structural declaration, content NOT MODELLED): （対象会計年度の意義）
-- heading (structural declaration, content NOT MODELLED): （対象租税の範囲）
-- heading (structural declaration, content NOT MODELLED): （対質）
-- heading (structural declaration, content NOT MODELLED): （導管会社等の範囲）
-- heading (structural declaration, content NOT MODELLED): （小切手の交付）
-- heading (structural declaration, content NOT MODELLED): （小切手の使用の禁止）
-- heading (structural declaration, content NOT MODELLED): （小切手の支払等）
-- heading (structural declaration, content NOT MODELLED): （小切手の記載事項等）
-- heading (structural declaration, content NOT MODELLED): （小切手の記載事項）
-- heading (structural declaration, content NOT MODELLED): （小切手金額の償還）
-- heading (structural declaration, content NOT MODELLED): （小規模事業者の要件）
-- heading (structural declaration, content NOT MODELLED): （居住用土地等の非課税）
-- heading (structural declaration, content NOT MODELLED): （居宅サービスの範囲等）
-- heading (structural declaration, content NOT MODELLED): （届出に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （届出に係る経過規定）
-- heading (structural declaration, content NOT MODELLED): （届出場所の基準）
-- heading (structural declaration, content NOT MODELLED): （届出書の添付書類）
-- heading (structural declaration, content NOT MODELLED): （届出書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （届出書等の提出の特例）
-- heading (structural declaration, content NOT MODELLED): （届出義務）
-- heading (structural declaration, content NOT MODELLED): （届出）
-- heading (structural declaration, content NOT MODELLED): （山林所得）
-- heading (structural declaration, content NOT MODELLED): （島における特例）
-- heading (structural declaration, content NOT MODELLED): （工事の請負）
-- heading (structural declaration, content NOT MODELLED): （差し押えた債権の取立）
-- heading (structural declaration, content NOT MODELLED): （差し押える債権の範囲）
-- heading (structural declaration, content NOT MODELLED): （差押えの場合の届出）
-- heading (structural declaration, content NOT MODELLED): （差押えの解除の手続）
-- heading (structural declaration, content NOT MODELLED): （差押えの解除の要件）
-- heading (structural declaration, content NOT MODELLED): （差押に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （差押の要件）
-- heading (structural declaration, content NOT MODELLED): （差押不動産の使用収益）
-- heading (structural declaration, content NOT MODELLED): （差押動産等の管理）
-- heading (structural declaration, content NOT MODELLED): （差押動産等の表示）
-- heading (structural declaration, content NOT MODELLED): （差押物件等の引渡し）
-- heading (structural declaration, content NOT MODELLED): （差押調書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （差押調書）
-- heading (structural declaration, content NOT MODELLED): （差押財産搬出の手続）
-- heading (structural declaration, content NOT MODELLED): （差額仕訳書）
-- heading (structural declaration, content NOT MODELLED): （差額課税の適用除外等）
-- heading (structural declaration, content NOT MODELLED): （市場暗号資産等の範囲）
-- heading (structural declaration, content NOT MODELLED): （市町村に対する交付）
-- heading (structural declaration, content NOT MODELLED): （市町村民税と信託財産）
-- heading (structural declaration, content NOT MODELLED): （市町村民税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （市町村民税の減免）
-- heading (structural declaration, content NOT MODELLED): （市町村民税の申告等）
-- heading (structural declaration, content NOT MODELLED): （市町村民税の経過措置）
-- heading (structural declaration, content NOT MODELLED): （帰属割合の計算等）
-- heading (structural declaration, content NOT MODELLED): （帳簿の備付け等）
-- heading (structural declaration, content NOT MODELLED): （帳簿の備付け）
-- heading (structural declaration, content NOT MODELLED): （帳簿の記載事項等）
-- heading (structural declaration, content NOT MODELLED): （帳簿の記載事項）
-- heading (structural declaration, content NOT MODELLED): （帳簿作成の義務）
-- heading (structural declaration, content NOT MODELLED): （帳簿及び報告書等）
-- heading (structural declaration, content NOT MODELLED): （帳簿書類の備付け等）
-- heading (structural declaration, content NOT MODELLED): （帳簿書類の整理保存等）
-- heading (structural declaration, content NOT MODELLED): （帳簿書類の整理保存）
-- heading (structural declaration, content NOT MODELLED): （帳簿等の備付け）
-- heading (structural declaration, content NOT MODELLED): （帳簿等の書式）
-- heading (structural declaration, content NOT MODELLED): （帳簿記載義務）
-- heading (structural declaration, content NOT MODELLED): （常用の従業者）
-- heading (structural declaration, content NOT MODELLED): （年度の区分）
-- heading (structural declaration, content NOT MODELLED): （年末調整の細目）
-- heading (structural declaration, content NOT MODELLED): （年末調整）
-- heading (structural declaration, content NOT MODELLED): （年金に係る契約の範囲）
-- heading (structural declaration, content NOT MODELLED): （幹事）
-- heading (structural declaration, content NOT MODELLED): （庶務）
-- heading (structural declaration, content NOT MODELLED): （廃棄の承認の申請等）
-- heading (structural declaration, content NOT MODELLED): （延期又は続行の議決）
-- heading (structural declaration, content NOT MODELLED): （延滞税の免除の手続等）
-- heading (structural declaration, content NOT MODELLED): （延滞税の免除の手続）
-- heading (structural declaration, content NOT MODELLED): （延滞税の割合の特例）
-- heading (structural declaration, content NOT MODELLED): （延滞税の特則）
-- heading (structural declaration, content NOT MODELLED): （延滞税等）
-- heading (structural declaration, content NOT MODELLED): （延滞税）
-- heading (structural declaration, content NOT MODELLED): （延滞金の免除）
-- heading (structural declaration, content NOT MODELLED): （延滞金の減免）
-- heading (structural declaration, content NOT MODELLED): （延滞金等の計算）
-- heading (structural declaration, content NOT MODELLED): （延納に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （延納の要件）
-- heading (structural declaration, content NOT MODELLED): （延納の許可限度額）
-- heading (structural declaration, content NOT MODELLED): （延納届出書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （延納手続）
-- heading (structural declaration, content NOT MODELLED): （延納等に係る利子税）
-- heading (structural declaration, content NOT MODELLED): （建議等）
-- heading (structural declaration, content NOT MODELLED): （当期純損益金額）
-- heading (structural declaration, content NOT MODELLED): （当該職員の権限）
-- heading (structural declaration, content NOT MODELLED): （当該職員の証票携帯）
-- heading (structural declaration, content NOT MODELLED): （当該職員の質問検査権）
-- heading (structural declaration, content NOT MODELLED): （役員の任命）
-- heading (structural declaration, content NOT MODELLED): （役員の任期）
-- heading (structural declaration, content NOT MODELLED): （役員の兼職禁止）
-- heading (structural declaration, content NOT MODELLED): （役員の欠格条項）
-- heading (structural declaration, content NOT MODELLED): （役員の範囲）
-- heading (structural declaration, content NOT MODELLED): （役員の職務及び権限）
-- heading (structural declaration, content NOT MODELLED): （役員の解任命令）
-- heading (structural declaration, content NOT MODELLED): （役員の解任）
-- heading (structural declaration, content NOT MODELLED): （役員の選任）
-- heading (structural declaration, content NOT MODELLED): （役員給与の損金不算入）
-- heading (structural declaration, content NOT MODELLED): （役員）
-- heading (structural declaration, content NOT MODELLED): （従前の保税地域）
-- heading (structural declaration, content NOT MODELLED): （従前の手続の効力）
-- heading (structural declaration, content NOT MODELLED): （徴収の引継ぎ）
-- heading (structural declaration, content NOT MODELLED): （徴収の順位）
-- heading (structural declaration, content NOT MODELLED): （徴収事務の引継）
-- heading (structural declaration, content NOT MODELLED): （徴収権の消滅時効）
-- heading (structural declaration, content NOT MODELLED): （徴収決定済額の登記等）
-- heading (structural declaration, content NOT MODELLED): （徴収猶予の効果）
-- heading (structural declaration, content NOT MODELLED): （徴収猶予の取消し）
-- heading (structural declaration, content NOT MODELLED): （徴収猶予の申請手続等）
-- heading (structural declaration, content NOT MODELLED): （徴収猶予の要件等）
-- heading (structural declaration, content NOT MODELLED): （徴収猶予の通知）
-- heading (structural declaration, content NOT MODELLED): （徴収税額）
-- heading (structural declaration, content NOT MODELLED): （徴税吏員がした処分）
-- heading (structural declaration, content NOT MODELLED): （必要な行為の継続等）
-- heading (structural declaration, content NOT MODELLED): （必要経費）
-- heading (structural declaration, content NOT MODELLED): （忠実義務）
-- heading (structural declaration, content NOT MODELLED): （恒久的施設の範囲）
-- heading (structural declaration, content NOT MODELLED): （恒久的施設等の範囲）
-- heading (structural declaration, content NOT MODELLED): （情報提供）
-- heading (structural declaration, content NOT MODELLED): （意見の聴取）
-- heading (structural declaration, content NOT MODELLED): （意見の表明）
-- heading (structural declaration, content NOT MODELLED): （意見書の交付）
-- heading (structural declaration, content NOT MODELLED): （懲戒の手続等）
-- heading (structural declaration, content NOT MODELLED): （懲戒の種類）
-- heading (structural declaration, content NOT MODELLED): （懲戒処分の公告の方法）
-- heading (structural declaration, content NOT MODELLED): （懲戒処分の公告）
-- heading (structural declaration, content NOT MODELLED): （成立の届出等）
-- heading (structural declaration, content NOT MODELLED): （成立の時期）
-- heading (structural declaration, content NOT MODELLED): （所在地国の判定）
-- heading (structural declaration, content NOT MODELLED): （所属税理士の業務）
-- heading (structural declaration, content NOT MODELLED): （所得の計算）
-- heading (structural declaration, content NOT MODELLED): （所得割の税率）
-- heading (structural declaration, content NOT MODELLED): （所得割の課税標準）
-- heading (structural declaration, content NOT MODELLED): （所得控除の細目）
-- heading (structural declaration, content NOT MODELLED): （所得控除の順序）
-- heading (structural declaration, content NOT MODELLED): （所得控除）
-- heading (structural declaration, content NOT MODELLED): （所得税に係る措置）
-- heading (structural declaration, content NOT MODELLED): （所得税の特例）
-- heading (structural declaration, content NOT MODELLED): （所得税の非課税）
-- heading (structural declaration, content NOT MODELLED): （所得税法の特例）
-- heading (structural declaration, content NOT MODELLED): （所得税法の適用）
-- heading (structural declaration, content NOT MODELLED): （所得税法等の施行）
-- heading (structural declaration, content NOT MODELLED): （所得税法等の特例）
-- heading (structural declaration, content NOT MODELLED): （所得税額の控除）
-- heading (structural declaration, content NOT MODELLED): （所得税額の計算の順序）
-- heading (structural declaration, content NOT MODELLED): （所得税額等の還付）
-- heading (structural declaration, content NOT MODELLED): （所得譲与税法の廃止）
-- heading (structural declaration, content NOT MODELLED): （所得金額調整控除）
-- heading (structural declaration, content NOT MODELLED): （所得額に関する統計等）
-- heading (structural declaration, content NOT MODELLED): （所掌事務）
-- heading (structural declaration, content NOT MODELLED): （所有持分）
-- heading (structural declaration, content NOT MODELLED): （所有者等の立会い）
-- heading (structural declaration, content NOT MODELLED): （手持品課税等）
-- heading (structural declaration, content NOT MODELLED): （手持品課税）
-- heading (structural declaration, content NOT MODELLED): （手数料の前納等）
-- heading (structural declaration, content NOT MODELLED): （手数料の軽減又は免除）
-- heading (structural declaration, content NOT MODELLED): （手数料）
-- heading (structural declaration, content NOT MODELLED): （手続の細目）
-- heading (structural declaration, content NOT MODELLED): （払戻し税額の計算）
-- heading (structural declaration, content NOT MODELLED): （払込資本の額）
-- heading (structural declaration, content NOT MODELLED): （扶養控除）
-- heading (structural declaration, content NOT MODELLED): （承認の取消しの手続）
-- heading (structural declaration, content NOT MODELLED): （承認の取消し等）
-- heading (structural declaration, content NOT MODELLED): （承認の取消し）
-- heading (structural declaration, content NOT MODELLED): （承認の失効）
-- heading (structural declaration, content NOT MODELLED): （承認の手数料）
-- heading (structural declaration, content NOT MODELLED): （承認の手続等）
-- heading (structural declaration, content NOT MODELLED): （承認の要件）
-- heading (structural declaration, content NOT MODELLED): （承認を受ける義務）
-- heading (structural declaration, content NOT MODELLED): （承認免税手続事業者）
-- heading (structural declaration, content NOT MODELLED): （承認又は許可の基準）
-- heading (structural declaration, content NOT MODELLED): （承認手数料）
-- heading (structural declaration, content NOT MODELLED): （承認申請書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （承認規定等の範囲）
-- heading (structural declaration, content NOT MODELLED): （承認送受信事業者）
-- heading (structural declaration, content NOT MODELLED): （技術的読替え等）
-- heading (structural declaration, content NOT MODELLED): （投資証券の範囲等）
-- heading (structural declaration, content NOT MODELLED): （抗告訴訟の取扱い）
-- heading (structural declaration, content NOT MODELLED): （担保に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （担保の処分）
-- heading (structural declaration, content NOT MODELLED): （担保の変更等）
-- heading (structural declaration, content NOT MODELLED): （担保の徴取）
-- heading (structural declaration, content NOT MODELLED): （担保の提供の手続等）
-- heading (structural declaration, content NOT MODELLED): （担保の提供の手続）
-- heading (structural declaration, content NOT MODELLED): （担保の提供の期限等）
-- heading (structural declaration, content NOT MODELLED): （担保の提供命令の手続）
-- heading (structural declaration, content NOT MODELLED): （担保の提供手続）
-- heading (structural declaration, content NOT MODELLED): （担保の提供等）
-- heading (structural declaration, content NOT MODELLED): （担保の提供）
-- heading (structural declaration, content NOT MODELLED): （担保の種類）
-- heading (structural declaration, content NOT MODELLED): （担保の解除）
-- heading (structural declaration, content NOT MODELLED): （担保を提供させる手続）
-- heading (structural declaration, content NOT MODELLED): （担保責任等）
-- heading (structural declaration, content NOT MODELLED): （担保）
-- heading (structural declaration, content NOT MODELLED): （担当審判官の通知）
-- heading (structural declaration, content NOT MODELLED): （担当審判官等の指定）
-- heading (structural declaration, content NOT MODELLED): （指定の取消し）
-- heading (structural declaration, content NOT MODELLED): （指定の基準等）
-- heading (structural declaration, content NOT MODELLED): （指定の基準）
-- heading (structural declaration, content NOT MODELLED): （指定の解除）
-- heading (structural declaration, content NOT MODELLED): （指定の通知等）
-- heading (structural declaration, content NOT MODELLED): （指定保税地域の処分等）
-- heading (structural declaration, content NOT MODELLED): （指定団体の指定）
-- heading (structural declaration, content NOT MODELLED): （指定施設の申請）
-- heading (structural declaration, content NOT MODELLED): （指定期間の延長手続）
-- heading (structural declaration, content NOT MODELLED): （指定物品の範囲等）
-- heading (structural declaration, content NOT MODELLED): （指定研修の公告等）
-- heading (structural declaration, content NOT MODELLED): （指定研修の要件）
-- heading (structural declaration, content NOT MODELLED): （指定等の公表）
-- heading (structural declaration, content NOT MODELLED): （指示等）
-- heading (structural declaration, content NOT MODELLED): （振替済書の徴取）
-- heading (structural declaration, content NOT MODELLED): （捜索の時間制限）
-- heading (structural declaration, content NOT MODELLED): （捜索の権限及び方法）
-- heading (structural declaration, content NOT MODELLED): （捜索の立会人）
-- heading (structural declaration, content NOT MODELLED): （捜索証明書の交付）
-- heading (structural declaration, content NOT MODELLED): （捜索調書の作成）
-- heading (structural declaration, content NOT MODELLED): （捜索調書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （採取の開廃等の申告）
-- heading (structural declaration, content NOT MODELLED): （採取者とみなす場合）
-- heading (structural declaration, content NOT MODELLED): （探鉱準備金）
-- heading (structural declaration, content NOT MODELLED): （控除の特例）
-- heading (structural declaration, content NOT MODELLED): （控除限度額の計算）
-- heading (structural declaration, content NOT MODELLED): （控除額算定の年度区分）
-- heading (structural declaration, content NOT MODELLED): （掲示）
-- heading (structural declaration, content NOT MODELLED): （提出書類）
-- heading (structural declaration, content NOT MODELLED): （提出物件の留置き）
-- heading (structural declaration, content NOT MODELLED): （提示を要しない郵便物）
-- heading (structural declaration, content NOT MODELLED): （換価する財産の範囲等）
-- heading (structural declaration, content NOT MODELLED): （換価の制限）
-- heading (structural declaration, content NOT MODELLED): （換価の猶予の要件等）
-- heading (structural declaration, content NOT MODELLED): （換価代金等の交付期日）
-- heading (structural declaration, content NOT MODELLED): （換価代金等の交付）
-- heading (structural declaration, content NOT MODELLED): （換価代金等の供託）
-- heading (structural declaration, content NOT MODELLED): （換価執行決定の取消し）
-- heading (structural declaration, content NOT MODELLED): （揮発油等とみなす場合）
-- heading (structural declaration, content NOT MODELLED): （損益通算の順序）
-- heading (structural declaration, content NOT MODELLED): （損益通算）
-- heading (structural declaration, content NOT MODELLED): （摘要）
-- heading (structural declaration, content NOT MODELLED): （支出した寄附金の額）
-- heading (structural declaration, content NOT MODELLED): （支払の決定）
-- heading (structural declaration, content NOT MODELLED): （支払の調査決定）
-- heading (structural declaration, content NOT MODELLED): （支払命令済額の登記）
-- heading (structural declaration, content NOT MODELLED): （支払場所の変更手続）
-- heading (structural declaration, content NOT MODELLED): （支払場所）
-- heading (structural declaration, content NOT MODELLED): （支払未済額の登記）
-- heading (structural declaration, content NOT MODELLED): （支払未済額の繰越）
-- heading (structural declaration, content NOT MODELLED): （支払決定済額の振替）
-- heading (structural declaration, content NOT MODELLED): （支払決定済額の登記）
-- heading (structural declaration, content NOT MODELLED): （支払計画の示達）
-- heading (structural declaration, content NOT MODELLED): （支払計画残額の登記）
-- heading (structural declaration, content NOT MODELLED): （支払計画示達の効力）
-- heading (structural declaration, content NOT MODELLED): （支払計画示達額の登記）
-- heading (structural declaration, content NOT MODELLED): （支払計画等の示達）
-- heading (structural declaration, content NOT MODELLED): （支払調書の書式）
-- heading (structural declaration, content NOT MODELLED): （支払金の指定）
-- heading (structural declaration, content NOT MODELLED): （支部の内部組織）
-- heading (structural declaration, content NOT MODELLED): （支部の管理課の事務）
-- heading (structural declaration, content NOT MODELLED): （政令委任）
-- heading (structural declaration, content NOT MODELLED): （政府への引渡の証明等）
-- heading (structural declaration, content NOT MODELLED): （政治資金規正法関係）
-- heading (structural declaration, content NOT MODELLED): （故意不申告の罪）
-- heading (structural declaration, content NOT MODELLED): （教授等の届出）
-- heading (structural declaration, content NOT MODELLED): （数値急増補正）
-- heading (structural declaration, content NOT MODELLED): （数値急減補正）
-- heading (structural declaration, content NOT MODELLED): （数）
-- heading (structural declaration, content NOT MODELLED): （新法の適用区分）
-- heading (structural declaration, content NOT MODELLED): （施行の期日）
-- heading (structural declaration, content NOT MODELLED): （施行を延期する法律）
-- heading (structural declaration, content NOT MODELLED): （施行期日及び適用区分）
-- heading (structural declaration, content NOT MODELLED): （施行期日等）
-- heading (structural declaration, content NOT MODELLED): （施行期日）
-- heading (structural declaration, content NOT MODELLED): （旅客等の携帯品の留置）
-- heading (structural declaration, content NOT MODELLED): （旅客運賃等の範囲等）
-- heading (structural declaration, content NOT MODELLED): （日払の給与等の意義）
-- heading (structural declaration, content NOT MODELLED): （日時、場所等の公告）
-- heading (structural declaration, content NOT MODELLED): （日本税理士会連合会）
-- heading (structural declaration, content NOT MODELLED): （旧保険業法関係）
-- heading (structural declaration, content NOT MODELLED): （旧書式の使用）
-- heading (structural declaration, content NOT MODELLED): （旧銀行法関係）
-- heading (structural declaration, content NOT MODELLED): （時価ヘッジ処理）
-- heading (structural declaration, content NOT MODELLED): （時価評価資産等の範囲）
-- heading (structural declaration, content NOT MODELLED): （普通交付税の額の算定）
-- heading (structural declaration, content NOT MODELLED): （暗号資産の取得価額）
-- heading (structural declaration, content NOT MODELLED): （暗号資産の評価の方法）
-- heading (structural declaration, content NOT MODELLED): （暗号資産等取引の範囲）
-- heading (structural declaration, content NOT MODELLED): （暫定措置の期間）
-- heading (structural declaration, content NOT MODELLED): （暫定税率）
-- heading (structural declaration, content NOT MODELLED): （更正に関する特例）
-- heading (structural declaration, content NOT MODELLED): （更正に関する経過規定）
-- heading (structural declaration, content NOT MODELLED): （更正の特例等）
-- heading (structural declaration, content NOT MODELLED): （更正の請求の手続）
-- heading (structural declaration, content NOT MODELLED): （更正の請求の特例）
-- heading (structural declaration, content NOT MODELLED): （更正の請求の特則）
-- heading (structural declaration, content NOT MODELLED): （更正の請求等）
-- heading (structural declaration, content NOT MODELLED): （更正の請求）
-- heading (structural declaration, content NOT MODELLED): （更正又は決定の所轄庁）
-- heading (structural declaration, content NOT MODELLED): （更正又は決定の手続）
-- heading (structural declaration, content NOT MODELLED): （更正又は決定の通知）
-- heading (structural declaration, content NOT MODELLED): （更正及び決定の特則）
-- heading (structural declaration, content NOT MODELLED): （更正及び決定等）
-- heading (structural declaration, content NOT MODELLED): （更正及び決定）
-- heading (structural declaration, content NOT MODELLED): （更正等の効力）
-- heading (structural declaration, content NOT MODELLED): （更正請求書の様式）
-- heading (structural declaration, content NOT MODELLED): （更正）
-- heading (structural declaration, content NOT MODELLED): （書式に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （書式に関する経過規定）
-- heading (structural declaration, content NOT MODELLED): （書式表示等の書式）
-- heading (structural declaration, content NOT MODELLED): （書式）
-- heading (structural declaration, content NOT MODELLED): （書類の作成要領）
-- heading (structural declaration, content NOT MODELLED): （書類の送達）
-- heading (structural declaration, content NOT MODELLED): （最高価申込者の決定）
-- heading (structural declaration, content NOT MODELLED): （有価証券の取得価額）
-- heading (structural declaration, content NOT MODELLED): （有価証券の空売り等）
-- heading (structural declaration, content NOT MODELLED): （有価証券の範囲）
-- heading (structural declaration, content NOT MODELLED): （有価証券の裏書等）
-- heading (structural declaration, content NOT MODELLED): （有価証券の記録等）
-- heading (structural declaration, content NOT MODELLED): （有価証券の評価の方法）
-- heading (structural declaration, content NOT MODELLED): （有価証券）
-- heading (structural declaration, content NOT MODELLED): （期間の末日の特例）
-- heading (structural declaration, content NOT MODELLED): （期間の計算等）
-- heading (structural declaration, content NOT MODELLED): （期限の特例）
-- heading (structural declaration, content NOT MODELLED): （期限内申告）
-- heading (structural declaration, content NOT MODELLED): （期限後特例申告）
-- heading (structural declaration, content NOT MODELLED): （期限後申告の特則）
-- heading (structural declaration, content NOT MODELLED): （期限後申告）
-- heading (structural declaration, content NOT MODELLED): （木材の指定）
-- heading (structural declaration, content NOT MODELLED): （未成年者控除）
-- heading (structural declaration, content NOT MODELLED): （未納税引取り）
-- heading (structural declaration, content NOT MODELLED): （未納税引取）
-- heading (structural declaration, content NOT MODELLED): （未納税移出の承認申請）
-- heading (structural declaration, content NOT MODELLED): （未納税移出等）
-- heading (structural declaration, content NOT MODELLED): （未納税移出）
-- heading (structural declaration, content NOT MODELLED): （本人確認の方法）
-- heading (structural declaration, content NOT MODELLED): （本人確認書類の範囲等）
-- heading (structural declaration, content NOT MODELLED): （本邦の産業）
-- heading (structural declaration, content NOT MODELLED): （条件付差押禁止財産）
-- heading (structural declaration, content NOT MODELLED): （果実酒の原料等）
-- heading (structural declaration, content NOT MODELLED): （棚卸資産の取得価額）
-- heading (structural declaration, content NOT MODELLED): （棚卸資産の範囲）
-- heading (structural declaration, content NOT MODELLED): （棚卸資産の評価の方法）
-- heading (structural declaration, content NOT MODELLED): （森林環境譲与税の使途）
-- heading (structural declaration, content NOT MODELLED): （森林環境譲与税）
-- heading (structural declaration, content NOT MODELLED): （検察官への引継ぎ）
-- heading (structural declaration, content NOT MODELLED): （検査事務等）
-- heading (structural declaration, content NOT MODELLED): （検査免除の手続）
-- heading (structural declaration, content NOT MODELLED): （検査員）
-- heading (structural declaration, content NOT MODELLED): （検査役の選任）
-- heading (structural declaration, content NOT MODELLED): （検査拒否等に関する罪）
-- heading (structural declaration, content NOT MODELLED): （検討）
-- heading (structural declaration, content NOT MODELLED): （業務の停止）
-- heading (structural declaration, content NOT MODELLED): （業務の制限）
-- heading (structural declaration, content NOT MODELLED): （業務の執行方法）
-- heading (structural declaration, content NOT MODELLED): （業務の範囲）
-- heading (structural declaration, content NOT MODELLED): （業務を執行する権限）
-- heading (structural declaration, content NOT MODELLED): （業務改善命令）
-- heading (structural declaration, content NOT MODELLED): （業務方法書）
-- heading (structural declaration, content NOT MODELLED): （業務等の改善命令）
-- heading (structural declaration, content NOT MODELLED): （様式に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （標準審理期間）
-- heading (structural declaration, content NOT MODELLED): （標識の掲示）
-- heading (structural declaration, content NOT MODELLED): （権利移転の登記の嘱託）
-- heading (structural declaration, content NOT MODELLED): （権限の委任等）
-- heading (structural declaration, content NOT MODELLED): （権限の委任）
-- heading (structural declaration, content NOT MODELLED): （権限の解釈）
-- heading (structural declaration, content NOT MODELLED): （機構指定納付受託者）
-- heading (structural declaration, content NOT MODELLED): （欠損金の繰越し）
-- heading (structural declaration, content NOT MODELLED): （欠損金の通算）
-- heading (structural declaration, content NOT MODELLED): （欠格条項）
-- heading (structural declaration, content NOT MODELLED): （欠減控除）
-- heading (structural declaration, content NOT MODELLED): （次席国税審判官）
-- heading (structural declaration, content NOT MODELLED): （次長）
-- heading (structural declaration, content NOT MODELLED): （正常価格）
-- heading (structural declaration, content NOT MODELLED): （武器の携帯及び使用）
-- heading (structural declaration, content NOT MODELLED): （歳入への組入れ）
-- heading (structural declaration, content NOT MODELLED): （死亡保険金額等）
-- heading (structural declaration, content NOT MODELLED): （毎年度の譲与額）
-- heading (structural declaration, content NOT MODELLED): （水利地益税等の減免）
-- heading (structural declaration, content NOT MODELLED): （水利地益税）
-- heading (structural declaration, content NOT MODELLED): （水産物加工製品の指定）
-- heading (structural declaration, content NOT MODELLED): （決定の手続等）
-- heading (structural declaration, content NOT MODELLED): （決定）
-- heading (structural declaration, content NOT MODELLED): （決算に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （決算報告の作成）
-- heading (structural declaration, content NOT MODELLED): （決算関係書類の提出）
-- heading (structural declaration, content NOT MODELLED): （決算関係書類等の提出）
-- heading (structural declaration, content NOT MODELLED): （決算）
-- heading (structural declaration, content NOT MODELLED): （沖縄路線航空機の範囲）
-- heading (structural declaration, content NOT MODELLED): （法人の事業税の減免）
-- heading (structural declaration, content NOT MODELLED): （法人の地位）
-- heading (structural declaration, content NOT MODELLED): （法人の均等割の税率）
-- heading (structural declaration, content NOT MODELLED): （法人の納税地）
-- heading (structural declaration, content NOT MODELLED): （法人格及び住所）
-- heading (structural declaration, content NOT MODELLED): （法人税の特例）
-- heading (structural declaration, content NOT MODELLED): （法人税割の税率）
-- heading (structural declaration, content NOT MODELLED): （法人税法の一部改正）
-- heading (structural declaration, content NOT MODELLED): （法人税法の特例）
-- heading (structural declaration, content NOT MODELLED): （法人税法の適用）
-- heading (structural declaration, content NOT MODELLED): （法務大臣等の通知）
-- heading (structural declaration, content NOT MODELLED): （法定地上権等の設定）
-- heading (structural declaration, content NOT MODELLED): （法定外目的税の減免）
-- heading (structural declaration, content NOT MODELLED): （法定脱退）
-- heading (structural declaration, content NOT MODELLED): （法律上資格を有する者）
-- heading (structural declaration, content NOT MODELLED): （海外投資等損失準備金）
-- heading (structural declaration, content NOT MODELLED): （消費生活物資の減税）
-- heading (structural declaration, content NOT MODELLED): （消費税の免税手続）
-- heading (structural declaration, content NOT MODELLED): （消費税の創設）
-- heading (structural declaration, content NOT MODELLED): （消費税法の特例）
-- heading (structural declaration, content NOT MODELLED): （消費税等の免除手続等）
-- heading (structural declaration, content NOT MODELLED): （消費譲与税の創設）
-- heading (structural declaration, content NOT MODELLED): （消費譲与税法の廃止）
-- heading (structural declaration, content NOT MODELLED): （消防法関係）
-- heading (structural declaration, content NOT MODELLED): （消防組織法関係）
-- heading (structural declaration, content NOT MODELLED): （清算人の職務及び権限）
-- heading (structural declaration, content NOT MODELLED): （清算人の解任）
-- heading (structural declaration, content NOT MODELLED): （清算人会の議事録）
-- heading (structural declaration, content NOT MODELLED): （清算人）
-- heading (structural declaration, content NOT MODELLED): （清算結了の届出）
-- heading (structural declaration, content NOT MODELLED): （清算結了の登記の申請）
-- heading (structural declaration, content NOT MODELLED): （清算結了の登記）
-- heading (structural declaration, content NOT MODELLED): （清算）
-- heading (structural declaration, content NOT MODELLED): （清酒に係る特例）
-- heading (structural declaration, content NOT MODELLED): （清酒に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （清酒の原料となる糖類）
-- heading (structural declaration, content NOT MODELLED): （清酒の原料）
-- heading (structural declaration, content NOT MODELLED): （減価償却資産の範囲）
-- heading (structural declaration, content NOT MODELLED): （減免税割当申請書）
-- heading (structural declaration, content NOT MODELLED): （減免税割当証明書）
-- heading (structural declaration, content NOT MODELLED): （減免税原料品の割当て）
-- heading (structural declaration, content NOT MODELLED): （測定単位の数値の補正）
-- heading (structural declaration, content NOT MODELLED): （測定単位及び単位費用）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収票の書式）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収票）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収税額等の還付）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収義務等）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収義務者）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収義務）
-- heading (structural declaration, content NOT MODELLED): （源泉徴収）
-- heading (structural declaration, content NOT MODELLED): （準備行為）
-- heading (structural declaration, content NOT MODELLED): （準用）
-- heading (structural declaration, content NOT MODELLED): （滅却の承認申請手続）
-- heading (structural declaration, content NOT MODELLED): （滞納処分に関する罪）
-- heading (structural declaration, content NOT MODELLED): （滞納処分の停止の取消）
-- heading (structural declaration, content NOT MODELLED): （滞納処分費の範囲）
-- heading (structural declaration, content NOT MODELLED): （滞納処分）
-- heading (structural declaration, content NOT MODELLED): （灯油の規格）
-- heading (structural declaration, content NOT MODELLED): （災害の範囲等）
-- heading (structural declaration, content NOT MODELLED): （災害の範囲）
-- heading (structural declaration, content NOT MODELLED): （災害損失金額の範囲）
-- heading (structural declaration, content NOT MODELLED): （為替予約差額の配分）
-- heading (structural declaration, content NOT MODELLED): （為替取引を行った日）
-- heading (structural declaration, content NOT MODELLED): （無条件免税）
-- heading (structural declaration, content NOT MODELLED): （無申告加算税）
-- heading (structural declaration, content NOT MODELLED): （物品の区分）
-- heading (structural declaration, content NOT MODELLED): （物納の場合の調査決定）
-- heading (structural declaration, content NOT MODELLED): （物納の撤回に係る延納）
-- heading (structural declaration, content NOT MODELLED): （物納の撤回）
-- heading (structural declaration, content NOT MODELLED): （物納の要件）
-- heading (structural declaration, content NOT MODELLED): （物納の許可の取消し）
-- heading (structural declaration, content NOT MODELLED): （物納の許可限度額）
-- heading (structural declaration, content NOT MODELLED): （物納劣後財産）
-- heading (structural declaration, content NOT MODELLED): （物納手続）
-- heading (structural declaration, content NOT MODELLED): （物納等に係る利子税）
-- heading (structural declaration, content NOT MODELLED): （物納財産の収納価額等）
-- heading (structural declaration, content NOT MODELLED): （物納財産の収納手続）
-- heading (structural declaration, content NOT MODELLED): （物納財産収納後の手続）
-- heading (structural declaration, content NOT MODELLED): （特例公債の減債）
-- heading (structural declaration, content NOT MODELLED): （特例公債の発行）
-- heading (structural declaration, content NOT MODELLED): （特別とん譲与税の使途）
-- heading (structural declaration, content NOT MODELLED): （特別とん譲与税）
-- heading (structural declaration, content NOT MODELLED): （特別の議決）
-- heading (structural declaration, content NOT MODELLED): （特別交付税の額の算定）
-- heading (structural declaration, content NOT MODELLED): （特別交付金の交付時期）
-- heading (structural declaration, content NOT MODELLED): （特別交付金の使途）
-- heading (structural declaration, content NOT MODELLED): （特別区における特例）
-- heading (structural declaration, content NOT MODELLED): （特別区税等の特例）
-- heading (structural declaration, content NOT MODELLED): （特別土地保有税の減免）
-- heading (structural declaration, content NOT MODELLED): （特別土地保有税の税率）
-- heading (structural declaration, content NOT MODELLED): （特別土地保有税の税額）
-- heading (structural declaration, content NOT MODELLED): （特別徴収に係る納入）
-- heading (structural declaration, content NOT MODELLED): （特別徴収の手続）
-- heading (structural declaration, content NOT MODELLED): （特別徴収票）
-- heading (structural declaration, content NOT MODELLED): （特別徴収税額の通知等）
-- heading (structural declaration, content NOT MODELLED): （特別徴収税額）
-- heading (structural declaration, content NOT MODELLED): （特別法人事業譲与税）
-- heading (structural declaration, content NOT MODELLED): （特別農業所得者の申請）
-- heading (structural declaration, content NOT MODELLED): （特別障害者の範囲）
-- heading (structural declaration, content NOT MODELLED): （特定取引の範囲）
-- heading (structural declaration, content NOT MODELLED): （特定受益証券発行信託）
-- heading (structural declaration, content NOT MODELLED): （特定口座廃止届出書）
-- heading (structural declaration, content NOT MODELLED): （特定口座異動届出書）
-- heading (structural declaration, content NOT MODELLED): （特定役務の提供の範囲）
-- heading (structural declaration, content NOT MODELLED): （特定徴収金の収納）
-- heading (structural declaration, content NOT MODELLED): （特定株主等の範囲等）
-- heading (structural declaration, content NOT MODELLED): （特定用途免税の範囲）
-- heading (structural declaration, content NOT MODELLED): （特定用途免税）
-- heading (structural declaration, content NOT MODELLED): （特定組織再編成の範囲）
-- heading (structural declaration, content NOT MODELLED): （特定船舶の特別償却）
-- heading (structural declaration, content NOT MODELLED): （特定親族特別控除）
-- heading (structural declaration, content NOT MODELLED): （特定関係の判定等）
-- heading (structural declaration, content NOT MODELLED): （特恵関税等）
-- heading (structural declaration, content NOT MODELLED): （特殊な場合の納税地）
-- heading (structural declaration, content NOT MODELLED): （特殊船舶等の入港手続）
-- heading (structural declaration, content NOT MODELLED): （特殊船舶等の出港手続）
-- heading (structural declaration, content NOT MODELLED): （特殊関係の範囲）
-- heading (structural declaration, content NOT MODELLED): （特殊関係使用人の範囲）
-- heading (structural declaration, content NOT MODELLED): （特殊関係法人の範囲）
-- heading (structural declaration, content NOT MODELLED): （特殊関係者の範囲）
-- heading (structural declaration, content NOT MODELLED): （特約業者の指定等）
-- heading (structural declaration, content NOT MODELLED): （狩猟税に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （狩猟税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （狩猟税の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （狩猟税の減免）
-- heading (structural declaration, content NOT MODELLED): （狩猟税の税率の特例）
-- heading (structural declaration, content NOT MODELLED): （狩猟税の税率）
-- heading (structural declaration, content NOT MODELLED): （狩猟税の課税免除）
-- heading (structural declaration, content NOT MODELLED): （狩猟税）
-- heading (structural declaration, content NOT MODELLED): （現先取引債券等の範囲）
-- heading (structural declaration, content NOT MODELLED): （現金の保管）
-- heading (structural declaration, content NOT MODELLED): （現金の払込み）
-- heading (structural declaration, content NOT MODELLED): （現金払込報告）
-- heading (structural declaration, content NOT MODELLED): （現金払込済仕訳書）
-- heading (structural declaration, content NOT MODELLED): （現金納付）
-- heading (structural declaration, content NOT MODELLED): （理事の責任）
-- heading (structural declaration, content NOT MODELLED): （理事への事務引継）
-- heading (structural declaration, content NOT MODELLED): （理事会の議事録）
-- heading (structural declaration, content NOT MODELLED): （理事会）
-- heading (structural declaration, content NOT MODELLED): （琉球法令の租税）
-- heading (structural declaration, content NOT MODELLED): （生命保険契約等の範囲）
-- heading (structural declaration, content NOT MODELLED): （生命保険料控除）
-- heading (structural declaration, content NOT MODELLED): （生命共済契約等の範囲）
-- heading (structural declaration, content NOT MODELLED): （生存給付金等の範囲）
-- heading (structural declaration, content NOT MODELLED): （生活必需品の関税免除）
-- heading (structural declaration, content NOT MODELLED): （生産設備等の範囲）
-- heading (structural declaration, content NOT MODELLED): （用語の定義）
-- heading (structural declaration, content NOT MODELLED): （用語の意義）
-- heading (structural declaration, content NOT MODELLED): （用語）
-- heading (structural declaration, content NOT MODELLED): （用途外使用等の制限）
-- heading (structural declaration, content NOT MODELLED): （申告、納付及び還付）
-- heading (structural declaration, content NOT MODELLED): （申告による納付等）
-- heading (structural declaration, content NOT MODELLED): （申告による納付）
-- heading (structural declaration, content NOT MODELLED): （申告の特例）
-- heading (structural declaration, content NOT MODELLED): （申告及び納付等）
-- heading (structural declaration, content NOT MODELLED): （申告書の付記事項）
-- heading (structural declaration, content NOT MODELLED): （申告書の共同提出）
-- heading (structural declaration, content NOT MODELLED): （申告書の書式の特例）
-- heading (structural declaration, content NOT MODELLED): （申告書等の記載事項）
-- heading (structural declaration, content NOT MODELLED): （申告書等）
-- heading (structural declaration, content NOT MODELLED): （申告等）
-- heading (structural declaration, content NOT MODELLED): （申告納税見積額の計算）
-- heading (structural declaration, content NOT MODELLED): （申告義務の承継等）
-- heading (structural declaration, content NOT MODELLED): （申告義務等の承継）
-- heading (structural declaration, content NOT MODELLED): （申告義務）
-- heading (structural declaration, content NOT MODELLED): （申告）
-- heading (structural declaration, content NOT MODELLED): （申請書の様式等）
-- heading (structural declaration, content NOT MODELLED): （申請書の記載事項等）
-- heading (structural declaration, content NOT MODELLED): （申請書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （申請書等の様式の特例）
-- heading (structural declaration, content NOT MODELLED): （申請等の指定）
-- heading (structural declaration, content NOT MODELLED): （申請等の期限の延長等）
-- heading (structural declaration, content NOT MODELLED): （申請等の期限の延長）
-- heading (structural declaration, content NOT MODELLED): （留置権の優先）
-- heading (structural declaration, content NOT MODELLED): （療養、医療等の範囲）
-- heading (structural declaration, content NOT MODELLED): （発生し得る危険の範囲）
-- heading (structural declaration, content NOT MODELLED): （発行日取引の範囲）
-- heading (structural declaration, content NOT MODELLED): （発起人）
-- heading (structural declaration, content NOT MODELLED): （発電用の石油の免税）
-- heading (structural declaration, content NOT MODELLED): （登記の期間）
-- heading (structural declaration, content NOT MODELLED): （登記所からの通知）
-- heading (structural declaration, content NOT MODELLED): （登記簿）
-- heading (structural declaration, content NOT MODELLED): （登記）
-- heading (structural declaration, content NOT MODELLED): （登録に関する決定）
-- heading (structural declaration, content NOT MODELLED): （登録のための講習）
-- heading (structural declaration, content NOT MODELLED): （登録の取消し）
-- heading (structural declaration, content NOT MODELLED): （登録の抹消）
-- heading (structural declaration, content NOT MODELLED): （登録の申請）
-- heading (structural declaration, content NOT MODELLED): （登録の細目）
-- heading (structural declaration, content NOT MODELLED): （登録事項）
-- heading (structural declaration, content NOT MODELLED): （登録抹消の制限）
-- heading (structural declaration, content NOT MODELLED): （登録拒否事由）
-- heading (structural declaration, content NOT MODELLED): （登録船舶の登録の取消）
-- heading (structural declaration, content NOT MODELLED): （登録）
-- heading (structural declaration, content NOT MODELLED): （監事の職務及び権限）
-- heading (structural declaration, content NOT MODELLED): （監督上の措置）
-- heading (structural declaration, content NOT MODELLED): （監督命令）
-- heading (structural declaration, content NOT MODELLED): （目的）
-- heading (structural declaration, content NOT MODELLED): （相互主義）
-- heading (structural declaration, content NOT MODELLED): （相互会社に準ずるもの）
-- heading (structural declaration, content NOT MODELLED): （相互銀行法関係）
-- heading (structural declaration, content NOT MODELLED): （相手国等への情報提供）
-- heading (structural declaration, content NOT MODELLED): （相次相続控除）
-- heading (structural declaration, content NOT MODELLED): （相殺関税）
-- heading (structural declaration, content NOT MODELLED): （相続時精算課税の選択）
-- heading (structural declaration, content NOT MODELLED): （相続税の物納の特例）
-- heading (structural declaration, content NOT MODELLED): （相続税の申告書）
-- heading (structural declaration, content NOT MODELLED): （相続税の納税義務者）
-- heading (structural declaration, content NOT MODELLED): （相続税の総額）
-- heading (structural declaration, content NOT MODELLED): （相続税の課税価格）
-- heading (structural declaration, content NOT MODELLED): （相続税の課税）
-- heading (structural declaration, content NOT MODELLED): （相続税の非課税財産）
-- heading (structural declaration, content NOT MODELLED): （相続税法の一部改正）
-- heading (structural declaration, content NOT MODELLED): （相続税法の特例）
-- heading (structural declaration, content NOT MODELLED): （相続税法の適用）
-- heading (structural declaration, content NOT MODELLED): （相続税額の加算）
-- heading (structural declaration, content NOT MODELLED): （相続財産等の調査）
-- heading (structural declaration, content NOT MODELLED): （省令への委任）
-- heading (structural declaration, content NOT MODELLED): （督促）
-- heading (structural declaration, content NOT MODELLED): （短期事業年度の範囲等）
-- heading (structural declaration, content NOT MODELLED): （短期売買商品等の範囲）
-- heading (structural declaration, content NOT MODELLED): （短期譲渡所得の範囲）
-- heading (structural declaration, content NOT MODELLED): （石油ガス税の免税手続）
-- heading (structural declaration, content NOT MODELLED): （石油ガス税の軽減）
-- heading (structural declaration, content NOT MODELLED): （石油ガス税法の特例）
-- heading (structural declaration, content NOT MODELLED): （石油ガス譲与税の使途）
-- heading (structural declaration, content NOT MODELLED): （石油ガス譲与税法関係）
-- heading (structural declaration, content NOT MODELLED): （石油ガス譲与税）
-- heading (structural declaration, content NOT MODELLED): （石油化学製品及び用途）
-- heading (structural declaration, content NOT MODELLED): （石油石炭税の免税手続）
-- heading (structural declaration, content NOT MODELLED): （石油石炭税法の特例）
-- heading (structural declaration, content NOT MODELLED): （石油製品の混合）
-- heading (structural declaration, content NOT MODELLED): （石炭に係る税率の特例）
-- heading (structural declaration, content NOT MODELLED): （研修）
-- heading (structural declaration, content NOT MODELLED): （研究所の解散等）
-- heading (structural declaration, content NOT MODELLED): （確定所得申告）
-- heading (structural declaration, content NOT MODELLED): （確定損失申告）
-- heading (structural declaration, content NOT MODELLED): （確定申告による納付）
-- heading (structural declaration, content NOT MODELLED): （確定申告による還付）
-- heading (structural declaration, content NOT MODELLED): （確定申告書の添付書類）
-- heading (structural declaration, content NOT MODELLED): （確定申告書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （確定申告税額の延納）
-- heading (structural declaration, content NOT MODELLED): （確定申告）
-- heading (structural declaration, content NOT MODELLED): （社会保険料の範囲）
-- heading (structural declaration, content NOT MODELLED): （社会保険料控除）
-- heading (structural declaration, content NOT MODELLED): （社員の常駐）
-- heading (structural declaration, content NOT MODELLED): （社員の競業の禁止）
-- heading (structural declaration, content NOT MODELLED): （社員の資格）
-- heading (structural declaration, content NOT MODELLED): （福島再開投資等準備金）
-- heading (structural declaration, content NOT MODELLED): （私金との混同禁止）
-- heading (structural declaration, content NOT MODELLED): （科目の区分）
-- heading (structural declaration, content NOT MODELLED): （科目の訂正の登記等）
-- heading (structural declaration, content NOT MODELLED): （秘密を守る義務）
-- heading (structural declaration, content NOT MODELLED): （秘密漏えいに関する罪）
-- heading (structural declaration, content NOT MODELLED): （租税条約に基づく認定）
-- heading (structural declaration, content NOT MODELLED): （租税特別措置法の適用）
-- heading (structural declaration, content NOT MODELLED): （租税納付の委託）
-- heading (structural declaration, content NOT MODELLED): （移出に係る灯油の免税）
-- heading (structural declaration, content NOT MODELLED): （移出数量の算定）
-- heading (structural declaration, content NOT MODELLED): （税務代理の権限の明示）
-- heading (structural declaration, content NOT MODELLED): （税務代理権限証書）
-- heading (structural declaration, content NOT MODELLED): （税務書類等への付記）
-- heading (structural declaration, content NOT MODELLED): （税務署長による徴収）
-- heading (structural declaration, content NOT MODELLED): （税印による納付の特例）
-- heading (structural declaration, content NOT MODELLED): （税法に関する研修）
-- heading (structural declaration, content NOT MODELLED): （税率）
-- heading (structural declaration, content NOT MODELLED): （税理士に関する特例）
-- heading (structural declaration, content NOT MODELLED): （税理士の使命）
-- heading (structural declaration, content NOT MODELLED): （税理士の業務）
-- heading (structural declaration, content NOT MODELLED): （税理士の資格）
-- heading (structural declaration, content NOT MODELLED): （税理士会の会則の変更）
-- heading (structural declaration, content NOT MODELLED): （税理士会の会則）
-- heading (structural declaration, content NOT MODELLED): （税理士会の分割）
-- heading (structural declaration, content NOT MODELLED): （税理士会の報告）
-- heading (structural declaration, content NOT MODELLED): （税理士会の支部）
-- heading (structural declaration, content NOT MODELLED): （税理士会の設立）
-- heading (structural declaration, content NOT MODELLED): （税理士会の通知）
-- heading (structural declaration, content NOT MODELLED): （税理士会）
-- heading (structural declaration, content NOT MODELLED): （税理士名簿）
-- heading (structural declaration, content NOT MODELLED): （税理士業務の制限）
-- heading (structural declaration, content NOT MODELLED): （税理士法の特例）
-- heading (structural declaration, content NOT MODELLED): （税理士法人の名簿）
-- heading (structural declaration, content NOT MODELLED): （税理士証票の提示）
-- heading (structural declaration, content NOT MODELLED): （税理士証票の返還）
-- heading (structural declaration, content NOT MODELLED): （税理士証票）
-- heading (structural declaration, content NOT MODELLED): （税関事務管理人）
-- heading (structural declaration, content NOT MODELLED): （税関検査の免除等）
-- heading (structural declaration, content NOT MODELLED): （税関職員の権限）
-- heading (structural declaration, content NOT MODELLED): （税関職員の派出の申請）
-- heading (structural declaration, content NOT MODELLED): （税関職員の派出）
-- heading (structural declaration, content NOT MODELLED): （税関長の権限の委任）
-- heading (structural declaration, content NOT MODELLED): （税関長の通告処分等）
-- heading (structural declaration, content NOT MODELLED): （税額の確定の方式）
-- heading (structural declaration, content NOT MODELLED): （税額の認定通知）
-- heading (structural declaration, content NOT MODELLED): （税額の認定）
-- heading (structural declaration, content NOT MODELLED): （税額控除の計算の細目）
-- heading (structural declaration, content NOT MODELLED): （税額控除の順序）
-- heading (structural declaration, content NOT MODELLED): （種別補正に用いる種別）
-- heading (structural declaration, content NOT MODELLED): （積込みとみなす場合）
-- heading (structural declaration, content NOT MODELLED): （立会い）
-- heading (structural declaration, content NOT MODELLED): （立木の評価）
-- heading (structural declaration, content NOT MODELLED): （端数計算）
-- heading (structural declaration, content NOT MODELLED): （競り売り）
-- heading (structural declaration, content NOT MODELLED): （第二次納税義務の通則）
-- heading (structural declaration, content NOT MODELLED): （答弁書の提出等）
-- heading (structural declaration, content NOT MODELLED): （答弁書の提出）
-- heading (structural declaration, content NOT MODELLED): （答弁書の特例）
-- heading (structural declaration, content NOT MODELLED): （算定方法の特例）
-- heading (structural declaration, content NOT MODELLED): （算定資料の提出）
-- heading (structural declaration, content NOT MODELLED): （算式の符号）
-- heading (structural declaration, content NOT MODELLED): （管理処分不適格財産）
-- heading (structural declaration, content NOT MODELLED): （管理室）
-- heading (structural declaration, content NOT MODELLED): （管理監督的地位等）
-- heading (structural declaration, content NOT MODELLED): （米の免税の手続）
-- heading (structural declaration, content NOT MODELLED): （粉末酒の数量の計算）
-- heading (structural declaration, content NOT MODELLED): （約束の申出等）
-- heading (structural declaration, content NOT MODELLED): （納付に係る届出等）
-- heading (structural declaration, content NOT MODELLED): （納付の委託に係る通知）
-- heading (structural declaration, content NOT MODELLED): （納付の手続）
-- heading (structural declaration, content NOT MODELLED): （納付の確認）
-- heading (structural declaration, content NOT MODELLED): （納付不足額の通知事項）
-- heading (structural declaration, content NOT MODELLED): （納付不足額の通知）
-- heading (structural declaration, content NOT MODELLED): （納付印の印影の形式等）
-- heading (structural declaration, content NOT MODELLED): （納付又は納入の告知）
-- heading (structural declaration, content NOT MODELLED): （納付又は納入の委託）
-- heading (structural declaration, content NOT MODELLED): （納付又は納入等）
-- heading (structural declaration, content NOT MODELLED): （納付受託の手続）
-- heading (structural declaration, content NOT MODELLED): （納付受託者の報告）
-- heading (structural declaration, content NOT MODELLED): （納付受託者の指定要件）
-- heading (structural declaration, content NOT MODELLED): （納付受託者の納付）
-- heading (structural declaration, content NOT MODELLED): （納付受託者）
-- heading (structural declaration, content NOT MODELLED): （納付場所）
-- heading (structural declaration, content NOT MODELLED): （納付委託の対象）
-- heading (structural declaration, content NOT MODELLED): （納付委託）
-- heading (structural declaration, content NOT MODELLED): （納付書の書式等）
-- heading (structural declaration, content NOT MODELLED): （納付書の書式）
-- heading (structural declaration, content NOT MODELLED): （納付書等の様式）
-- heading (structural declaration, content NOT MODELLED): （納付期限）
-- heading (structural declaration, content NOT MODELLED): （納付等事務の委託）
-- heading (structural declaration, content NOT MODELLED): （納付等）
-- heading (structural declaration, content NOT MODELLED): （納付金の免除）
-- heading (structural declaration, content NOT MODELLED): （納付）
-- heading (structural declaration, content NOT MODELLED): （納入の告知）
-- heading (structural declaration, content NOT MODELLED): （納入申告書の提出）
-- heading (structural declaration, content NOT MODELLED): （納期限に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （納期限の延長等の通知）
-- heading (structural declaration, content NOT MODELLED): （納期限の延長）
-- heading (structural declaration, content NOT MODELLED): （納期限）
-- heading (structural declaration, content NOT MODELLED): （納税の告知の手続）
-- heading (structural declaration, content NOT MODELLED): （納税の告知）
-- heading (structural declaration, content NOT MODELLED): （納税の猶予の効果）
-- heading (structural declaration, content NOT MODELLED): （納税の猶予の取消し）
-- heading (structural declaration, content NOT MODELLED): （納税の猶予の期間）
-- heading (structural declaration, content NOT MODELLED): （納税の猶予の特例）
-- heading (structural declaration, content NOT MODELLED): （納税の猶予の要件等）
-- heading (structural declaration, content NOT MODELLED): （納税の猶予の通知等）
-- heading (structural declaration, content NOT MODELLED): （納税地の指定）
-- heading (structural declaration, content NOT MODELLED): （納税地の特例）
-- heading (structural declaration, content NOT MODELLED): （納税地の異動の届出）
-- heading (structural declaration, content NOT MODELLED): （納税地）
-- heading (structural declaration, content NOT MODELLED): （納税申告書の提出先等）
-- heading (structural declaration, content NOT MODELLED): （納税管理人の届出手続）
-- heading (structural declaration, content NOT MODELLED): （納税管理人）
-- heading (structural declaration, content NOT MODELLED): （納税義務者）
-- heading (structural declaration, content NOT MODELLED): （納税者等の氏名）
-- heading (structural declaration, content NOT MODELLED): （納税証明事項）
-- heading (structural declaration, content NOT MODELLED): （納税証明書の交付等）
-- heading (structural declaration, content NOT MODELLED): （納税証明書の交付）
-- heading (structural declaration, content NOT MODELLED): （納税貯蓄組合法の特例）
-- heading (structural declaration, content NOT MODELLED): （納税貯蓄組合連合会）
-- heading (structural declaration, content NOT MODELLED): （納税資金の貯蓄方法）
-- heading (structural declaration, content NOT MODELLED): （純トン数の測度）
-- heading (structural declaration, content NOT MODELLED): （純損失の繰越控除）
-- heading (structural declaration, content NOT MODELLED): （紛議の調停）
-- heading (structural declaration, content NOT MODELLED): （組合と役員との関係）
-- heading (structural declaration, content NOT MODELLED): （組合の地区）
-- heading (structural declaration, content NOT MODELLED): （組合の構成要件）
-- heading (structural declaration, content NOT MODELLED): （組合を代表する理事）
-- heading (structural declaration, content NOT MODELLED): （組合代表の特例）
-- heading (structural declaration, content NOT MODELLED): （組合員の募集）
-- heading (structural declaration, content NOT MODELLED): （組合員の資格）
-- heading (structural declaration, content NOT MODELLED): （組合員名簿）
-- heading (structural declaration, content NOT MODELLED): （組織）
-- heading (structural declaration, content NOT MODELLED): （経済産業大臣の認定）
-- heading (structural declaration, content NOT MODELLED): （経済連携協定）
-- heading (structural declaration, content NOT MODELLED): （経由機関等）
-- heading (structural declaration, content NOT MODELLED): （経費の賦課）
-- heading (structural declaration, content NOT MODELLED): （経過措置の原則）
-- heading (structural declaration, content NOT MODELLED): （経過措置）
-- heading (structural declaration, content NOT MODELLED): （経過規定の原則）
-- heading (structural declaration, content NOT MODELLED): （経過規定）
-- heading (structural declaration, content NOT MODELLED): （給与の差押禁止）
-- heading (structural declaration, content NOT MODELLED): （給与所得）
-- heading (structural declaration, content NOT MODELLED): （給与等の源泉徴収票）
-- heading (structural declaration, content NOT MODELLED): （給付金の非課税等）
-- heading (structural declaration, content NOT MODELLED): （給付金の額）
-- heading (structural declaration, content NOT MODELLED): （給付金等の非課税）
-- heading (structural declaration, content NOT MODELLED): （統計の公表）
-- heading (structural declaration, content NOT MODELLED): （統計を作成する事項）
-- heading (structural declaration, content NOT MODELLED): （緊急関税等）
-- heading (structural declaration, content NOT MODELLED): （総代会）
-- heading (structural declaration, content NOT MODELLED): （総代）
-- heading (structural declaration, content NOT MODELLED): （総会の招集）
-- heading (structural declaration, content NOT MODELLED): （総会の決議の取消し）
-- heading (structural declaration, content NOT MODELLED): （総会の決議等の報告）
-- heading (structural declaration, content NOT MODELLED): （総会の議事録）
-- heading (structural declaration, content NOT MODELLED): （総会の議事）
-- heading (structural declaration, content NOT MODELLED): （総会の議決事項）
-- heading (structural declaration, content NOT MODELLED): （総会招集の承認の申請）
-- heading (structural declaration, content NOT MODELLED): （総会）
-- heading (structural declaration, content NOT MODELLED): （総則）
-- heading (structural declaration, content NOT MODELLED): （総務大臣の同意）
-- heading (structural declaration, content NOT MODELLED): （総務大臣の権限と責任）
-- heading (structural declaration, content NOT MODELLED): （総務大臣への報告）
-- heading (structural declaration, content NOT MODELLED): （総務省令への委任）
-- heading (structural declaration, content NOT MODELLED): （総合保税地域の許可）
-- heading (structural declaration, content NOT MODELLED): （繰上徴収の告知の手続）
-- heading (structural declaration, content NOT MODELLED): （繰上徴収）
-- heading (structural declaration, content NOT MODELLED): （繰上請求）
-- heading (structural declaration, content NOT MODELLED): （繰延ヘッジ処理）
-- heading (structural declaration, content NOT MODELLED): （繰延資産の償却限度額）
-- heading (structural declaration, content NOT MODELLED): （繰延資産の範囲）
-- heading (structural declaration, content NOT MODELLED): （繰越控除限度額等）
-- heading (structural declaration, content NOT MODELLED): （繰越控除限度額）
-- heading (structural declaration, content NOT MODELLED): （罰則に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （罰則に係る経過規定）
-- heading (structural declaration, content NOT MODELLED): （罰則に対する経過措置）
-- heading (structural declaration, content NOT MODELLED): （罰則に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （罰則に関する経過規定）
-- heading (structural declaration, content NOT MODELLED): （罰則の経過措置）
-- heading (structural declaration, content NOT MODELLED): （罰則の適用）
-- heading (structural declaration, content NOT MODELLED): （罰則）
-- heading (structural declaration, content NOT MODELLED): （罰金等の措置）
-- heading (structural declaration, content NOT MODELLED): （署名の義務）
-- heading (structural declaration, content NOT MODELLED): （翌年度以降への繰越し）
-- heading (structural declaration, content NOT MODELLED): （耐用年数の短縮）
-- heading (structural declaration, content NOT MODELLED): （耐用年数）
-- heading (structural declaration, content NOT MODELLED): （職員の任命）
-- heading (structural declaration, content NOT MODELLED): （職員の責任）
-- heading (structural declaration, content NOT MODELLED): （職権登記等の非課税）
-- heading (structural declaration, content NOT MODELLED): （脱税、虚偽記載等の罪）
-- heading (structural declaration, content NOT MODELLED): （脱税に関する罪）
-- heading (structural declaration, content NOT MODELLED): （脱税相談等の禁止）
-- heading (structural declaration, content NOT MODELLED): （臨時所得の範囲）
-- heading (structural declaration, content NOT MODELLED): （自動車の部分品の指定）
-- heading (structural declaration, content NOT MODELLED): （自動車税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （自動車税のみなす課税）
-- heading (structural declaration, content NOT MODELLED): （自動車税の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （自動車税の標準税率）
-- heading (structural declaration, content NOT MODELLED): （自動車税の減免）
-- heading (structural declaration, content NOT MODELLED): （自動車税の税率の特例）
-- heading (structural declaration, content NOT MODELLED): （自動車税の納期）
-- heading (structural declaration, content NOT MODELLED): （自動車税の納税管理人）
-- heading (structural declaration, content NOT MODELLED): （自動車税の賦課期日）
-- heading (structural declaration, content NOT MODELLED): （自動車等の譲渡価額）
-- heading (structural declaration, content NOT MODELLED): （自動車重量税の免税等）
-- heading (structural declaration, content NOT MODELLED): （自動車重量税率の特例）
-- heading (structural declaration, content NOT MODELLED): （自動車重量譲与税）
-- heading (structural declaration, content NOT MODELLED): （航空機の範囲）
-- heading (structural declaration, content NOT MODELLED): （航空機燃料税の免除等）
-- heading (structural declaration, content NOT MODELLED): （航空機燃料譲与税）
-- heading (structural declaration, content NOT MODELLED): （航空機部分品等の免税）
-- heading (structural declaration, content NOT MODELLED): （血液事業の範囲）
-- heading (structural declaration, content NOT MODELLED): （行政庁等）
-- heading (structural declaration, content NOT MODELLED): （行政手続法の適用除外）
-- heading (structural declaration, content NOT MODELLED): （行政書士法関係）
-- heading (structural declaration, content NOT MODELLED): （表示の印影の形式等）
-- heading (structural declaration, content NOT MODELLED): （表示の基準）
-- heading (structural declaration, content NOT MODELLED): （表示事項）
-- heading (structural declaration, content NOT MODELLED): （表示方法の届出等）
-- heading (structural declaration, content NOT MODELLED): （被少数保有構成会社等）
-- heading (structural declaration, content NOT MODELLED): （被支配会社の範囲）
-- heading (structural declaration, content NOT MODELLED): （裁判所による監督）
-- heading (structural declaration, content NOT MODELLED): （裁決の拘束力）
-- heading (structural declaration, content NOT MODELLED): （裁決の方式等）
-- heading (structural declaration, content NOT MODELLED): （裁決）
-- heading (structural declaration, content NOT MODELLED): （装置の指定）
-- heading (structural declaration, content NOT MODELLED): （補助金の交付手続）
-- heading (structural declaration, content NOT MODELLED): （補助金の交付）
-- heading (structural declaration, content NOT MODELLED): （製品等の搬出入の届出）
-- heading (structural declaration, content NOT MODELLED): （製品等の検査）
-- heading (structural declaration, content NOT MODELLED): （製造の開廃等の申告）
-- heading (structural declaration, content NOT MODELLED): （製造免許等の条件）
-- heading (structural declaration, content NOT MODELLED): （製造免許等の要件）
-- heading (structural declaration, content NOT MODELLED): （製造免許等の通知）
-- heading (structural declaration, content NOT MODELLED): （製造又は販売業の廃止）
-- heading (structural declaration, content NOT MODELLED): （製造工場の承認手数料）
-- heading (structural declaration, content NOT MODELLED): （製造者とみなす場合）
-- heading (structural declaration, content NOT MODELLED): （製造者の認定）
-- heading (structural declaration, content NOT MODELLED): （複利年金現価率）
-- heading (structural declaration, content NOT MODELLED): （複利年金終価率）
-- heading (structural declaration, content NOT MODELLED): （複数の落札者の決定）
-- heading (structural declaration, content NOT MODELLED): （見本の一時持出）
-- heading (structural declaration, content NOT MODELLED): （見直し）
-- heading (structural declaration, content NOT MODELLED): （見積価額の公告等）
-- heading (structural declaration, content NOT MODELLED): （見積価額の決定）
-- heading (structural declaration, content NOT MODELLED): （規約の届出）
-- heading (structural declaration, content NOT MODELLED): （親族の範囲）
-- heading (structural declaration, content NOT MODELLED): （親法人の保有関係等）
-- heading (structural declaration, content NOT MODELLED): （解散の事由）
-- heading (structural declaration, content NOT MODELLED): （解散の届出）
-- heading (structural declaration, content NOT MODELLED): （解散の登記の申請）
-- heading (structural declaration, content NOT MODELLED): （解散の登記）
-- heading (structural declaration, content NOT MODELLED): （解散命令）
-- heading (structural declaration, content NOT MODELLED): （解散）
-- heading (structural declaration, content NOT MODELLED): （計器の指定の申請等）
-- heading (structural declaration, content NOT MODELLED): （計算書の書式）
-- heading (structural declaration, content NOT MODELLED): （計算書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （記号表示の届出）
-- heading (structural declaration, content NOT MODELLED): （記帳等の命令）
-- heading (structural declaration, content NOT MODELLED): （記帳義務等）
-- heading (structural declaration, content NOT MODELLED): （記帳義務）
-- heading (structural declaration, content NOT MODELLED): （記載事項の訂正）
-- heading (structural declaration, content NOT MODELLED): （設立の手続）
-- heading (structural declaration, content NOT MODELLED): （設立の登記の申請）
-- heading (structural declaration, content NOT MODELLED): （設立の登記）
-- heading (structural declaration, content NOT MODELLED): （設立の認可）
-- heading (structural declaration, content NOT MODELLED): （設立届出書の添付書類）
-- heading (structural declaration, content NOT MODELLED): （設立）
-- heading (structural declaration, content NOT MODELLED): （許可の取消し等）
-- heading (structural declaration, content NOT MODELLED): （許可の失効）
-- heading (structural declaration, content NOT MODELLED): （許可の承継）
-- heading (structural declaration, content NOT MODELLED): （許可の要件）
-- heading (structural declaration, content NOT MODELLED): （許可状の提示）
-- heading (structural declaration, content NOT MODELLED): （訴訟に関する経過措置）
-- heading (structural declaration, content NOT MODELLED): （証券の取扱）
-- heading (structural declaration, content NOT MODELLED): （証券受領の手続）
-- heading (structural declaration, content NOT MODELLED): （証拠の提出等）
-- heading (structural declaration, content NOT MODELLED): （証拠書類等の提出）
-- heading (structural declaration, content NOT MODELLED): （証拠書類等の返還）
-- heading (structural declaration, content NOT MODELLED): （証拠等の閲覧）
-- heading (structural declaration, content NOT MODELLED): （証明の様式）
-- heading (structural declaration, content NOT MODELLED): （証明又は確認）
-- heading (structural declaration, content NOT MODELLED): （証明書の交付申請）
-- heading (structural declaration, content NOT MODELLED): （証明書の分割）
-- heading (structural declaration, content NOT MODELLED): （証明書の発給）
-- heading (structural declaration, content NOT MODELLED): （証明書の返納）
-- heading (structural declaration, content NOT MODELLED): （証紙の様式及び形式）
-- heading (structural declaration, content NOT MODELLED): （評価の原則）
-- heading (structural declaration, content NOT MODELLED): （評価損資産の範囲等）
-- heading (structural declaration, content NOT MODELLED): （評議員会）
-- heading (structural declaration, content NOT MODELLED): （試験の執行）
-- heading (structural declaration, content NOT MODELLED): （試験の細目）
-- heading (structural declaration, content NOT MODELLED): （試験免除の申請等）
-- heading (structural declaration, content NOT MODELLED): （試験合格者の公告）
-- heading (structural declaration, content NOT MODELLED): （試験実施地）
-- heading (structural declaration, content NOT MODELLED): （試験方法の指定）
-- heading (structural declaration, content NOT MODELLED): （試験科目）
-- heading (structural declaration, content NOT MODELLED): （認定の取消しの手続）
-- heading (structural declaration, content NOT MODELLED): （認定の取消し）
-- heading (structural declaration, content NOT MODELLED): （認定の失効）
-- heading (structural declaration, content NOT MODELLED): （認定の撤回）
-- heading (structural declaration, content NOT MODELLED): （認定基準の公告等）
-- heading (structural declaration, content NOT MODELLED): （認定書の交付）
-- heading (structural declaration, content NOT MODELLED): （読替え等）
-- heading (structural declaration, content NOT MODELLED): （読替規定）
-- heading (structural declaration, content NOT MODELLED): （課税の対象）
-- heading (structural declaration, content NOT MODELLED): （課税の範囲）
-- heading (structural declaration, content NOT MODELLED): （課税事業年度等）
-- heading (structural declaration, content NOT MODELLED): （課税事業年度）
-- heading (structural declaration, content NOT MODELLED): （課税価格の決定の原則）
-- heading (structural declaration, content NOT MODELLED): （課税価格の計算の特例）
-- heading (structural declaration, content NOT MODELLED): （課税価格）
-- heading (structural declaration, content NOT MODELLED): （課税対象金額の計算等）
-- heading (structural declaration, content NOT MODELLED): （課税所得の範囲）
-- heading (structural declaration, content NOT MODELLED): （課税期間）
-- heading (structural declaration, content NOT MODELLED): （課税標準の端数計算等）
-- heading (structural declaration, content NOT MODELLED): （課税標準の算定の細目）
-- heading (structural declaration, content NOT MODELLED): （課税標準及び税率）
-- heading (structural declaration, content NOT MODELLED): （課税標準申告）
-- heading (structural declaration, content NOT MODELLED): （課税標準）
-- heading (structural declaration, content NOT MODELLED): （課税物件の確定の時期）
-- heading (structural declaration, content NOT MODELLED): （課税物件及び税率）
-- heading (structural declaration, content NOT MODELLED): （課税物件）
-- heading (structural declaration, content NOT MODELLED): （課税物品の確定の時期）
-- heading (structural declaration, content NOT MODELLED): （課税目的及び課税物件）
-- heading (structural declaration, content NOT MODELLED): （課税関与の禁止）
-- heading (structural declaration, content NOT MODELLED): （調整控除）
-- heading (structural declaration, content NOT MODELLED): （調整規定）
-- heading (structural declaration, content NOT MODELLED): （調書の作成）
-- heading (structural declaration, content NOT MODELLED): （調書の提出）
-- heading (structural declaration, content NOT MODELLED): （調書の書式）
-- heading (structural declaration, content NOT MODELLED): （調書の記載事項等）
-- heading (structural declaration, content NOT MODELLED): （調書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （調査に関する協議等）
-- heading (structural declaration, content NOT MODELLED): （調査の嘱託）
-- heading (structural declaration, content NOT MODELLED): （調査の期間の延長）
-- heading (structural declaration, content NOT MODELLED): （調査の管轄及び引継ぎ）
-- heading (structural declaration, content NOT MODELLED): （調査の終了の際の手続）
-- heading (structural declaration, content NOT MODELLED): （調査の通知）
-- heading (structural declaration, content NOT MODELLED): （調査の開始の告示）
-- heading (structural declaration, content NOT MODELLED): （調査の開始の通知等）
-- heading (structural declaration, content NOT MODELLED): （調査会の運営）
-- heading (structural declaration, content NOT MODELLED): （調査決定の変更等）
-- heading (structural declaration, content NOT MODELLED): （調査決定）
-- heading (structural declaration, content NOT MODELLED): （請求書の様式等）
-- heading (structural declaration, content NOT MODELLED): （請求書類の送付）
-- heading (structural declaration, content NOT MODELLED): （警察官の援助）
-- heading (structural declaration, content NOT MODELLED): （警察官等の援助）
-- heading (structural declaration, content NOT MODELLED): （警察官等の通報）
-- heading (structural declaration, content NOT MODELLED): （議事録）
-- heading (structural declaration, content NOT MODELLED): （議事）
-- heading (structural declaration, content NOT MODELLED): （議決権のない株式等）
-- heading (structural declaration, content NOT MODELLED): （議決権）
-- heading (structural declaration, content NOT MODELLED): （議決）
-- heading (structural declaration, content NOT MODELLED): （譲与の基準）
-- heading (structural declaration, content NOT MODELLED): （譲渡の届出等）
-- heading (structural declaration, content NOT MODELLED): （譲渡割と信託財産）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の中間申告納付）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の払込みの方法）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の申告の特例）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の確定申告納付）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の納付の特例等）
-- heading (structural declaration, content NOT MODELLED): （譲渡割の還付の特例等）
-- heading (structural declaration, content NOT MODELLED): （譲渡所得）
-- heading (structural declaration, content NOT MODELLED): （譲渡申告書等の様式）
-- heading (structural declaration, content NOT MODELLED): （財務大臣の権限の委任）
-- heading (structural declaration, content NOT MODELLED): （財務省の帳簿）
-- heading (structural declaration, content NOT MODELLED): （財務省令への委任）
-- heading (structural declaration, content NOT MODELLED): （財務諸表に含める書類）
-- heading (structural declaration, content NOT MODELLED): （財務諸表等）
-- heading (structural declaration, content NOT MODELLED): （財産債務調書の提出）
-- heading (structural declaration, content NOT MODELLED): （財産目録の作成）
-- heading (structural declaration, content NOT MODELLED): （財産目録）
-- heading (structural declaration, content NOT MODELLED): （貨物の収容）
-- heading (structural declaration, content NOT MODELLED): （貨物の取扱い）
-- heading (structural declaration, content NOT MODELLED): （貨物の検査場所）
-- heading (structural declaration, content NOT MODELLED): （貨物の積卸し）
-- heading (structural declaration, content NOT MODELLED): （貨物割の払込みの方法）
-- heading (structural declaration, content NOT MODELLED): （貨物割の申告）
-- heading (structural declaration, content NOT MODELLED): （貨物割の納付等）
-- heading (structural declaration, content NOT MODELLED): （貨物割の賦課徴収等）
-- heading (structural declaration, content NOT MODELLED): （貨物割の還付等）
-- heading (structural declaration, content NOT MODELLED): （貨物確認書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （貨物自動車の範囲）
-- heading (structural declaration, content NOT MODELLED): （貯蓄保険の範囲）
-- heading (structural declaration, content NOT MODELLED): （買受人の制限）
-- heading (structural declaration, content NOT MODELLED): （買受代金の納付の効果）
-- heading (structural declaration, content NOT MODELLED): （買受代金の納付の手続）
-- heading (structural declaration, content NOT MODELLED): （買受申込み等の取消し）
-- heading (structural declaration, content NOT MODELLED): （貸倒れの範囲等）
-- heading (structural declaration, content NOT MODELLED): （貸倒れの範囲）
-- heading (structural declaration, content NOT MODELLED): （貸倒引当金）
-- heading (structural declaration, content NOT MODELLED): （貸借対照表等の提出）
-- heading (structural declaration, content NOT MODELLED): （貸借対照表等）
-- heading (structural declaration, content NOT MODELLED): （貸借対照表）
-- heading (structural declaration, content NOT MODELLED): （費用の負担）
-- heading (structural declaration, content NOT MODELLED): （資料の提出等の要求）
-- heading (structural declaration, content NOT MODELLED): （資本的支出）
-- heading (structural declaration, content NOT MODELLED): （資本金等の額）
-- heading (structural declaration, content NOT MODELLED): （資格審査会）
-- heading (structural declaration, content NOT MODELLED): （資産の区分）
-- heading (structural declaration, content NOT MODELLED): （資産の譲渡等の範囲）
-- heading (structural declaration, content NOT MODELLED): （資産再評価法の適用）
-- heading (structural declaration, content NOT MODELLED): （資産課税に係る措置）
-- heading (structural declaration, content NOT MODELLED): （資金の勘定別整理）
-- heading (structural declaration, content NOT MODELLED): （資金の支払計画等）
-- heading (structural declaration, content NOT MODELLED): （資金の支払計画）
-- heading (structural declaration, content NOT MODELLED): （資金の管理）
-- heading (structural declaration, content NOT MODELLED): （資金の経理）
-- heading (structural declaration, content NOT MODELLED): （資金の設置）
-- heading (structural declaration, content NOT MODELLED): （資金への受入）
-- heading (structural declaration, content NOT MODELLED): （資金受払表等）
-- heading (structural declaration, content NOT MODELLED): （資金現金出納簿）
-- heading (structural declaration, content NOT MODELLED): （賞与に係る徴収税額）
-- heading (structural declaration, content NOT MODELLED): （賦課徴収に関する報告）
-- heading (structural declaration, content NOT MODELLED): （賦課徴収）
-- heading (structural declaration, content NOT MODELLED): （賦課期日）
-- heading (structural declaration, content NOT MODELLED): （賦課決定の所轄庁等）
-- heading (structural declaration, content NOT MODELLED): （賦課決定の手続）
-- heading (structural declaration, content NOT MODELLED): （賦課決定の請求）
-- heading (structural declaration, content NOT MODELLED): （賦課決定）
-- heading (structural declaration, content NOT MODELLED): （質問、検査又は領置等）
-- heading (structural declaration, content NOT MODELLED): （質問検査権）
-- heading (structural declaration, content NOT MODELLED): （質問検査章の書式）
-- heading (structural declaration, content NOT MODELLED): （質問検査）
-- heading (structural declaration, content NOT MODELLED): （贈与税の基礎控除）
-- heading (structural declaration, content NOT MODELLED): （贈与税の申告書）
-- heading (structural declaration, content NOT MODELLED): （贈与税の税率）
-- heading (structural declaration, content NOT MODELLED): （贈与税の納税義務者）
-- heading (structural declaration, content NOT MODELLED): （贈与税の課税価格）
-- heading (structural declaration, content NOT MODELLED): （贈与税の課税）
-- heading (structural declaration, content NOT MODELLED): （贈与税の配偶者控除）
-- heading (structural declaration, content NOT MODELLED): （贈与税の非課税財産）
-- heading (structural declaration, content NOT MODELLED): （趣旨等）
-- heading (structural declaration, content NOT MODELLED): （趣旨）
-- heading (structural declaration, content NOT MODELLED): （身分の証明）
-- heading (structural declaration, content NOT MODELLED): （身分を示す証票）
-- heading (structural declaration, content NOT MODELLED): （身分証明書の交付等）
-- heading (structural declaration, content NOT MODELLED): （身分証明書の交付）
-- heading (structural declaration, content NOT MODELLED): （身分証明書の提示等）
-- heading (structural declaration, content NOT MODELLED): （身分証明書の携帯等）
-- heading (structural declaration, content NOT MODELLED): （車両等の輸入手続）
-- heading (structural declaration, content NOT MODELLED): （軽油の引取りの報告等）
-- heading (structural declaration, content NOT MODELLED): （軽油引取税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （軽油引取税の保全担保）
-- heading (structural declaration, content NOT MODELLED): （軽油引取税の徴収猶予）
-- heading (structural declaration, content NOT MODELLED): （軽油引取税の減免）
-- heading (structural declaration, content NOT MODELLED): （軽油引取税の税率）
-- heading (structural declaration, content NOT MODELLED): （軽油引取税の課税免除）
-- heading (structural declaration, content NOT MODELLED): （軽減税率等の適用手続）
-- heading (structural declaration, content NOT MODELLED): （軽自動車税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （軽自動車税の標準税率）
-- heading (structural declaration, content NOT MODELLED): （軽自動車税の減免）
-- heading (structural declaration, content NOT MODELLED): （軽自動車税の納期）
-- heading (structural declaration, content NOT MODELLED): （軽自動車税の賦課期日）
-- heading (structural declaration, content NOT MODELLED): （輸入数量の換算）
-- heading (structural declaration, content NOT MODELLED): （輸入数量の算出方法）
-- heading (structural declaration, content NOT MODELLED): （輸入申告の手続）
-- heading (structural declaration, content NOT MODELLED): （輸入申告の特例）
-- heading (structural declaration, content NOT MODELLED): （輸入申告書の記載事項）
-- heading (structural declaration, content NOT MODELLED): （輸入税の徴収）
-- heading (structural declaration, content NOT MODELLED): （輸入税の軽減等）
-- heading (structural declaration, content NOT MODELLED): （輸出の許可の取消し）
-- heading (structural declaration, content NOT MODELLED): （輸出免税等）
-- heading (structural declaration, content NOT MODELLED): （輸出免税）
-- heading (structural declaration, content NOT MODELLED): （輸出又は輸入の許可）
-- heading (structural declaration, content NOT MODELLED): （輸出取引等の範囲）
-- heading (structural declaration, content NOT MODELLED): （輸出取引等の証明）
-- heading (structural declaration, content NOT MODELLED): （輸出申告の手続）
-- heading (structural declaration, content NOT MODELLED): （輸出申告の特例）
-- heading (structural declaration, content NOT MODELLED): （農業の範囲）
-- heading (structural declaration, content NOT MODELLED): （農産物の範囲）
-- heading (structural declaration, content NOT MODELLED): （退職所得の収入の時期）
-- heading (structural declaration, content NOT MODELLED): （退職所得の課税の特例）
-- heading (structural declaration, content NOT MODELLED): （退職所得申告書）
-- heading (structural declaration, content NOT MODELLED): （退職所得）
-- heading (structural declaration, content NOT MODELLED): （退職給与引当金）
-- heading (structural declaration, content NOT MODELLED): （退職給与規程の範囲）
-- heading (structural declaration, content NOT MODELLED): （送達の共助）
-- heading (structural declaration, content NOT MODELLED): （通則）
-- heading (structural declaration, content NOT MODELLED): （通告の方法等）
-- heading (structural declaration, content NOT MODELLED): （通知）
-- heading (structural declaration, content NOT MODELLED): （通算制度の取りやめ等）
-- heading (structural declaration, content NOT MODELLED): （通算承認の手続等）
-- heading (structural declaration, content NOT MODELLED): （通算承認）
-- heading (structural declaration, content NOT MODELLED): （通算法人の範囲）
-- heading (structural declaration, content NOT MODELLED): （通話者等の確認）
-- heading (structural declaration, content NOT MODELLED): （通貨の換算）
-- heading (structural declaration, content NOT MODELLED): （通貨交換申込書の様式）
-- heading (structural declaration, content NOT MODELLED): （通関士試験の特例）
-- heading (structural declaration, content NOT MODELLED): （通関士講習）
-- heading (structural declaration, content NOT MODELLED): （通関手帳による通関等）
-- heading (structural declaration, content NOT MODELLED): （通関手続等）
-- heading (structural declaration, content NOT MODELLED): （通関業者の認定）
-- heading (structural declaration, content NOT MODELLED): （通関証明書の様式）
-- heading (structural declaration, content NOT MODELLED): （連合会の地区の承認）
-- heading (structural declaration, content NOT MODELLED): （連合会の特別の地区）
-- heading (structural declaration, content NOT MODELLED): （連合会）
-- heading (structural declaration, content NOT MODELLED): （連帯納付の義務等）
-- heading (structural declaration, content NOT MODELLED): （連帯納付の責任）
-- heading (structural declaration, content NOT MODELLED): （連帯納税義務）
-- heading (structural declaration, content NOT MODELLED): （運営の基本）
-- heading (structural declaration, content NOT MODELLED): （運営審議会）
-- heading (structural declaration, content NOT MODELLED): （運送期間の延長の手続）
-- heading (structural declaration, content NOT MODELLED): （運送目録の提出時期等）
-- heading (structural declaration, content NOT MODELLED): （運送目録の記載事項等）
-- heading (structural declaration, content NOT MODELLED): （過大な使用人給与の額）
-- heading (structural declaration, content NOT MODELLED): （過大な役員給与の額）
-- heading (structural declaration, content NOT MODELLED): （過少申告加算税）
-- heading (structural declaration, content NOT MODELLED): （過怠金）
-- heading (structural declaration, content NOT MODELLED): （過料）
-- heading (structural declaration, content NOT MODELLED): （過納額の還付）
-- heading (structural declaration, content NOT MODELLED): （過誤納の確認等）
-- heading (structural declaration, content NOT MODELLED): （過誤納金の充当の手続）
-- heading (structural declaration, content NOT MODELLED): （過誤納金の充当）
-- heading (structural declaration, content NOT MODELLED): （過誤納金の還付等）
-- heading (structural declaration, content NOT MODELLED): （過誤納金の還付）
-- heading (structural declaration, content NOT MODELLED): （過誤納金等の充当適状）
-- heading (structural declaration, content NOT MODELLED): （道府県民税と信託財産）
-- heading (structural declaration, content NOT MODELLED): （道府県民税の経過措置）
-- heading (structural declaration, content NOT MODELLED): （道府県知事の通知義務）
-- heading (structural declaration, content NOT MODELLED): （道府県間の協力）
-- heading (structural declaration, content NOT MODELLED): （違法行為等の是正）
-- heading (structural declaration, content NOT MODELLED): （遠洋漁業船等の範囲）
-- heading (structural declaration, content NOT MODELLED): （適用区分等）
-- heading (structural declaration, content NOT MODELLED): （適用区分）
-- heading (structural declaration, content NOT MODELLED): （適用実態調査の実施）
-- heading (structural declaration, content NOT MODELLED): （適用対象金額の計算）
-- heading (structural declaration, content NOT MODELLED): （適用法令）
-- heading (structural declaration, content NOT MODELLED): （適用除外）
-- heading (structural declaration, content NOT MODELLED): （適用額）
-- heading (structural declaration, content NOT MODELLED): （選別方法の指定）
-- heading (structural declaration, content NOT MODELLED): （遺産に係る基礎控除）
-- heading (structural declaration, content NOT MODELLED): （還付のための申告）
-- heading (structural declaration, content NOT MODELLED): （還付の公告等）
-- heading (structural declaration, content NOT MODELLED): （還付の公告）
-- heading (structural declaration, content NOT MODELLED): （還付の手続）
-- heading (structural declaration, content NOT MODELLED): （還付の計算期間等）
-- heading (structural declaration, content NOT MODELLED): （還付加算金等）
-- heading (structural declaration, content NOT MODELLED): （還付加算金）
-- heading (structural declaration, content NOT MODELLED): （還付及び充当）
-- heading (structural declaration, content NOT MODELLED): （還付等）
-- heading (structural declaration, content NOT MODELLED): （還付請求権の時効）
-- heading (structural declaration, content NOT MODELLED): （還付請求申告書等）
-- heading (structural declaration, content NOT MODELLED): （還付金の消滅時効）
-- heading (structural declaration, content NOT MODELLED): （還付金等の充当適状）
-- heading (structural declaration, content NOT MODELLED): （還付金等の消滅時効）
-- heading (structural declaration, content NOT MODELLED): （還付金等の益金不算入）
-- heading (structural declaration, content NOT MODELLED): （還付金等の端数計算等）
-- heading (structural declaration, content NOT MODELLED): （還付）
-- heading (structural declaration, content NOT MODELLED): （部会）
-- heading (structural declaration, content NOT MODELLED): （郵便物の保税運送）
-- heading (structural declaration, content NOT MODELLED): （郵便物の検査）
-- heading (structural declaration, content NOT MODELLED): （郵便物の関税の納付等）
-- heading (structural declaration, content NOT MODELLED): （都の特例）
-- heading (structural declaration, content NOT MODELLED): （都市計画税の税率）
-- heading (structural declaration, content NOT MODELLED): （都市計画税の納期）
-- heading (structural declaration, content NOT MODELLED): （都市計画税の賦課期日）
-- heading (structural declaration, content NOT MODELLED): （都道府県知事の事務）
-- heading (structural declaration, content NOT MODELLED): （配偶者の平均余命）
-- heading (structural declaration, content NOT MODELLED): （配偶者居住権等の評価）
-- heading (structural declaration, content NOT MODELLED): （配偶者控除）
-- heading (structural declaration, content NOT MODELLED): （配偶者特別控除）
-- heading (structural declaration, content NOT MODELLED): （配合飼料の指定）
-- heading (structural declaration, content NOT MODELLED): （配当すべき金銭）
-- heading (structural declaration, content NOT MODELLED): （配当の原則）
-- heading (structural declaration, content NOT MODELLED): （配当割に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （配当割に係る督促）
-- heading (structural declaration, content NOT MODELLED): （配当割の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （配当割の税率）
-- heading (structural declaration, content NOT MODELLED): （配当割の課税標準）
-- heading (structural declaration, content NOT MODELLED): （配当所得）
-- heading (structural declaration, content NOT MODELLED): （配当控除の特例）
-- heading (structural declaration, content NOT MODELLED): （配当控除）
-- heading (structural declaration, content NOT MODELLED): （配当等とみなす金額）
-- heading (structural declaration, content NOT MODELLED): （配当等の支払調書）
-- heading (structural declaration, content NOT MODELLED): （配当計算書）
-- heading (structural declaration, content NOT MODELLED): （配賦経費に関する書類）
-- heading (structural declaration, content NOT MODELLED): （酒母等の製造免許）
-- heading (structural declaration, content NOT MODELLED): （酒税に係る経過措置）
-- heading (structural declaration, content NOT MODELLED): （酒税法等の適用）
-- heading (structural declaration, content NOT MODELLED): （酒税等に関する改正）
-- heading (structural declaration, content NOT MODELLED): （酒類の定義及び種類）
-- heading (structural declaration, content NOT MODELLED): （酒類の差押）
-- heading (structural declaration, content NOT MODELLED): （酒類の数量の計算方法）
-- heading (structural declaration, content NOT MODELLED): （酒類の表示の基準）
-- heading (structural declaration, content NOT MODELLED): （酒類の製造免許の申請）
-- heading (structural declaration, content NOT MODELLED): （酒類の製造免許）
-- heading (structural declaration, content NOT MODELLED): （酒類の販売業免許）
-- heading (structural declaration, content NOT MODELLED): （酒類業組合等の名称）
-- heading (structural declaration, content NOT MODELLED): （酒類業組合）
-- heading (structural declaration, content NOT MODELLED): （酒類販売管理者の届出）
-- heading (structural declaration, content NOT MODELLED): （酒類販売管理者の選任）
-- heading (structural declaration, content NOT MODELLED): （酒類販売管理者）
-- heading (structural declaration, content NOT MODELLED): （重加算税）
-- heading (structural declaration, content NOT MODELLED): （重要でない工程）
-- heading (structural declaration, content NOT MODELLED): （金融機関の範囲）
-- heading (structural declaration, content NOT MODELLED): （金融機関等の範囲）
-- heading (structural declaration, content NOT MODELLED): （鉱区税に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （鉱区税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の徴収の方法）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の減免）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の税率）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の納期）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の納税管理人）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の納税義務者等）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の賦課期日）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の連帯納付義務）
-- heading (structural declaration, content NOT MODELLED): （鉱区税の非課税の範囲）
-- heading (structural declaration, content NOT MODELLED): （鉱産税に係る滞納処分）
-- heading (structural declaration, content NOT MODELLED): （鉱産税に係る督促）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の更正及び決定）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の減免）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の申告納付）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の税率）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の納期）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の納税管理人）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の納税義務者等）
-- heading (structural declaration, content NOT MODELLED): （鉱産税の重加算金）
-- heading (structural declaration, content NOT MODELLED): （鑑定等の嘱託）
-- heading (structural declaration, content NOT MODELLED): （開廃等の申告）
-- heading (structural declaration, content NOT MODELLED): （開業等の届出）
-- heading (structural declaration, content NOT MODELLED): （開港及び税関空港）
-- heading (structural declaration, content NOT MODELLED): （開示の請求）
-- heading (structural declaration, content NOT MODELLED): （間接国税の範囲）
-- heading (structural declaration, content NOT MODELLED): （間接地方税の範囲）
-- heading (structural declaration, content NOT MODELLED): （関係人等への協力要請）
-- heading (structural declaration, content NOT MODELLED): （関係命令の廃止）
-- heading (structural declaration, content NOT MODELLED): （関係書類の保存年数）
-- heading (structural declaration, content NOT MODELLED): （関係法人の範囲）
-- heading (structural declaration, content NOT MODELLED): （関係法令の整理）
-- heading (structural declaration, content NOT MODELLED): （関係法律の廃止）
-- heading (structural declaration, content NOT MODELLED): （関係行政機関の勧告等）
-- heading (structural declaration, content NOT MODELLED): （関税の免除の手続等）
-- heading (structural declaration, content NOT MODELLED): （関税の免除手続等）
-- heading (structural declaration, content NOT MODELLED): （関税の免除手続）
-- heading (structural declaration, content NOT MODELLED): （関税の免除）
-- heading (structural declaration, content NOT MODELLED): （関税の徴収）
-- heading (structural declaration, content NOT MODELLED): （関税免除物品の製造等）
-- heading (structural declaration, content NOT MODELLED): （関税割当てをする物品）
-- heading (structural declaration, content NOT MODELLED): （関税割当制度）
-- heading (structural declaration, content NOT MODELLED): （関税割当数量）
-- heading (structural declaration, content NOT MODELLED): （関税割当申請書）
-- heading (structural declaration, content NOT MODELLED): （関税割当証明書の分割）
-- heading (structural declaration, content NOT MODELLED): （関税割当証明書の返納）
-- heading (structural declaration, content NOT MODELLED): （関税割当証明書）
-- heading (structural declaration, content NOT MODELLED): （関税法の準用）
-- heading (structural declaration, content NOT MODELLED): （関税法の適用）
-- heading (structural declaration, content NOT MODELLED): （関税法等の準用）
-- heading (structural declaration, content NOT MODELLED): （関税法等の特例）
-- heading (structural declaration, content NOT MODELLED): （関税等の免除手続）
-- heading (structural declaration, content NOT MODELLED): （関税等を徴収する場合）
-- heading (structural declaration, content NOT MODELLED): （関連法人株式等の範囲）
-- heading (structural declaration, content NOT MODELLED): （閲覧期間）
-- heading (structural declaration, content NOT MODELLED): （附加税の禁止）
-- heading (structural declaration, content NOT MODELLED): （附属申告書等）
-- heading (structural declaration, content NOT MODELLED): （除外会社等の範囲）
-- heading (structural declaration, content NOT MODELLED): （除斥期間）
-- heading (structural declaration, content NOT MODELLED): （随意契約による売却）
-- heading (structural declaration, content NOT MODELLED): （隔地送金等の手続）
-- heading (structural declaration, content NOT MODELLED): （隔地送金資金の返納）
-- heading (structural declaration, content NOT MODELLED): （障害者の範囲等）
-- heading (structural declaration, content NOT MODELLED): （障害者の範囲）
-- heading (structural declaration, content NOT MODELLED): （障害者控除）
-- heading (structural declaration, content NOT MODELLED): （障害者等の範囲）
-- heading (structural declaration, content NOT MODELLED): （雑則）
-- heading (structural declaration, content NOT MODELLED): （雑所得）
-- heading (structural declaration, content NOT MODELLED): （雑損失の繰越控除）
-- heading (structural declaration, content NOT MODELLED): （雑損控除の特例）
-- heading (structural declaration, content NOT MODELLED): （雑損控除）
-- heading (structural declaration, content NOT MODELLED): （離職従業員の優先雇用）
-- heading (structural declaration, content NOT MODELLED): （難破貨物等の運送）
-- heading (structural declaration, content NOT MODELLED): （電子証明書の範囲）
-- heading (structural declaration, content NOT MODELLED): （電磁的方法）
-- heading (structural declaration, content NOT MODELLED): （青色申告の取りやめ等）
-- heading (structural declaration, content NOT MODELLED): （青色申告の取りやめ）
-- heading (structural declaration, content NOT MODELLED): （青色申告の承認の申請）
-- heading (structural declaration, content NOT MODELLED): （青色申告書に係る更正）
-- heading (structural declaration, content NOT MODELLED): （青色申告法人の決算）
-- heading (structural declaration, content NOT MODELLED): （青色申告特別控除）
-- heading (structural declaration, content NOT MODELLED): （青色申告者の帳簿書類）
-- heading (structural declaration, content NOT MODELLED): （青色申告）
-- heading (structural declaration, content NOT MODELLED): （非営利型法人の範囲）
-- heading (structural declaration, content NOT MODELLED): （非居住者への適用）
-- heading (structural declaration, content NOT MODELLED): （非課税の場合の証明）
-- heading (structural declaration, content NOT MODELLED): （非課税所得）
-- heading (structural declaration, content NOT MODELLED): （非課税文書）
-- heading (structural declaration, content NOT MODELLED): （非課税登記等）
-- heading (structural declaration, content NOT MODELLED): （非課税自動車）
-- heading (structural declaration, content NOT MODELLED): （非課税貯蓄廃止申告書）
-- heading (structural declaration, content NOT MODELLED): （非課税貯蓄申告書）
-- heading (structural declaration, content NOT MODELLED): （非課税貯蓄相続申込書）
-- heading (structural declaration, content NOT MODELLED): （非課税限度額の計算等）
-- heading (structural declaration, content NOT MODELLED): （非課税）
-- heading (structural declaration, content NOT MODELLED): （預貯金の範囲）
-- heading (structural declaration, content NOT MODELLED): （預貯金者等情報の管理）
-- heading (structural declaration, content NOT MODELLED): （預金保険法関係）
-- heading (structural declaration, content NOT MODELLED): （領収済等の証明請求）
-- heading (structural declaration, content NOT MODELLED): （領収済通知書等の保存）
-- heading (structural declaration, content NOT MODELLED): （領置物件等の処置）
-- heading (structural declaration, content NOT MODELLED): （領置物件等の封印等）
-- heading (structural declaration, content NOT MODELLED): （領置物件等の還付等）
-- heading (structural declaration, content NOT MODELLED): （領置目録等の作成等）
-- heading (structural declaration, content NOT MODELLED): （領置目録等の記載事項）
-- heading (structural declaration, content NOT MODELLED): （飼料の指定）
-- heading (structural declaration, content NOT MODELLED): （飼料の規格）
-- heading (structural declaration, content NOT MODELLED): （高額特定資産の範囲等）
example : parseParenDigits "（１）" = some 1 := by decide
example : parseParenDigits "（１０）" = some 10 := by decide
example : parseParenDigits "（１１）" = some 11 := by decide
example : parseParenDigits "（１２）" = some 12 := by decide
example : parseParenDigits "（１３）" = some 13 := by decide
example : parseParenDigits "（１４）" = some 14 := by decide
example : parseParenDigits "（１５）" = some 15 := by decide
example : parseParenDigits "（１６）" = some 16 := by decide
example : parseParenDigits "（１７）" = some 17 := by decide
example : parseParenDigits "（１８）" = some 18 := by decide
example : parseParenDigits "（１９）" = some 19 := by decide
example : parseParenDigits "（２）" = some 2 := by decide
example : parseParenDigits "（２０）" = some 20 := by decide
example : parseParenDigits "（２１）" = some 21 := by decide
example : parseParenDigits "（２２）" = some 22 := by decide
example : parseParenDigits "（２３）" = some 23 := by decide
example : parseParenDigits "（２４）" = some 24 := by decide
example : parseParenDigits "（２５）" = some 25 := by decide
example : parseParenDigits "（２６）" = some 26 := by decide
example : parseParenDigits "（２７）" = some 27 := by decide
example : parseParenDigits "（２８）" = some 28 := by decide
example : parseParenDigits "（２９）" = some 29 := by decide
example : parseParenDigits "（３）" = some 3 := by decide
example : parseParenDigits "（３０）" = some 30 := by decide
example : parseParenDigits "（３１）" = some 31 := by decide
example : parseParenDigits "（３２）" = some 32 := by decide
example : parseParenDigits "（３３）" = some 33 := by decide
example : parseParenDigits "（３４）" = some 34 := by decide
example : parseParenDigits "（４）" = some 4 := by decide
example : parseParenDigits "（５）" = some 5 := by decide
example : parseParenDigits "（６）" = some 6 := by decide
example : parseParenDigits "（７）" = some 7 := by decide
example : parseParenDigits "（８）" = some 8 := by decide
example : parseParenDigits "（９）" = some 9 := by decide
-- heading (structural declaration, content NOT MODELLED): （Ａ×Ｂ）
-- heading (structural declaration, content NOT MODELLED): （Ａ－Ｂ）
-- heading (structural declaration, content NOT MODELLED): （Ｂ×１．２３）
-- heading (structural declaration, content NOT MODELLED): （Ｂ×１０－２００）
-- heading (structural declaration, content NOT MODELLED): （Ｂ×１０－２５０）
-- heading (structural declaration, content NOT MODELLED): （Ｂ×１０－４００）
-- heading (structural declaration, content NOT MODELLED): （Ｂ×１０－５００）
-- heading (structural declaration, content NOT MODELLED): （Ｂ－Ａ）
-- heading (structural declaration, content NOT MODELLED): （Ｃ×Ｄ）
-- heading (structural declaration, content NOT MODELLED): （Ｃ－Ｂ）
-- heading (structural declaration, content NOT MODELLED): （Ｄ－Ｃ）
-- heading (structural declaration, content NOT MODELLED): （Ｄ／Ｂ－１．２０５）
-- heading (structural declaration, content NOT MODELLED): （Ｅ－Ｄ）
-- heading (structural declaration, content NOT MODELLED): （Ｅ／Ｃ－１．２１６）
-- heading (structural declaration, content NOT MODELLED): （Ｆ－Ｅ）
-- heading (structural declaration, content NOT MODELLED): （ｉ）
-- heading (structural declaration, content NOT MODELLED): （ｉｉ）
-- heading (structural declaration, content NOT MODELLED): （ｉｉｉ）
-- heading (structural declaration, content NOT MODELLED): （ｉｖ）
-- heading (structural declaration, content NOT MODELLED): （ｉｘ）
-- heading (structural declaration, content NOT MODELLED): （ｎ－１）
-- heading (structural declaration, content NOT MODELLED): （ｖ）
-- heading (structural declaration, content NOT MODELLED): （ｖｉ）
-- heading (structural declaration, content NOT MODELLED): （ｖｉｉ）
-- heading (structural declaration, content NOT MODELLED): （ｖｉｉｉ）
example : parseDigits "０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "０" := by decide
example : parseDigits "０" = some 0 := by decide
example : parseDigits "００３６２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００３６２" := by decide
example : parseDigits "００３６２" = some 362 := by decide
example : parseDigits "００３６８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００３６８" := by decide
example : parseDigits "００３６８" = some 368 := by decide
example : parseDigits "００４５１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００４５１" := by decide
example : parseDigits "００４５１" = some 451 := by decide
example : parseDigits "００４５２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００４５２" := by decide
example : parseDigits "００４５２" = some 452 := by decide
example : parseDigits "００４７７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００４７７" := by decide
example : parseDigits "００４７７" = some 477 := by decide
example : parseDigits "００５２０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５２０" := by decide
example : parseDigits "００５２０" = some 520 := by decide
example : parseDigits "００５２１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５２１" := by decide
example : parseDigits "００５２１" = some 521 := by decide
example : parseDigits "００５２２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５２２" := by decide
example : parseDigits "００５２２" = some 522 := by decide
example : parseDigits "００５２３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５２３" := by decide
example : parseDigits "００５２３" = some 523 := by decide
example : parseDigits "００５３９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５３９" := by decide
example : parseDigits "００５３９" = some 539 := by decide
example : parseDigits "００５４０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５４０" := by decide
example : parseDigits "００５４０" = some 540 := by decide
example : parseDigits "００５４１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５４１" := by decide
example : parseDigits "００５４１" = some 541 := by decide
example : parseDigits "００５５２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５５２" := by decide
example : parseDigits "００５５２" = some 552 := by decide
example : parseDigits "００５５６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５５６" := by decide
example : parseDigits "００５５６" = some 556 := by decide
example : parseDigits "００５９０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５９０" := by decide
example : parseDigits "００５９０" = some 590 := by decide
example : parseDigits "００５９１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００５９１" := by decide
example : parseDigits "００５９１" = some 591 := by decide
example : parseDigits "００６１５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６１５" := by decide
example : parseDigits "００６１５" = some 615 := by decide
example : parseDigits "００６１６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６１６" := by decide
example : parseDigits "００６１６" = some 616 := by decide
example : parseDigits "００６１７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６１７" := by decide
example : parseDigits "００６１７" = some 617 := by decide
example : parseDigits "００６１８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６１８" := by decide
example : parseDigits "００６１８" = some 618 := by decide
example : parseDigits "００６１９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６１９" := by decide
example : parseDigits "００６１９" = some 619 := by decide
example : parseDigits "００６２０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６２０" := by decide
example : parseDigits "００６２０" = some 620 := by decide
example : parseDigits "００６６９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００６６９" := by decide
example : parseDigits "００６６９" = some 669 := by decide
example : parseDigits "００７０３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００７０３" := by decide
example : parseDigits "００７０３" = some 703 := by decide
example : parseDigits "００７０４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００７０４" := by decide
example : parseDigits "００７０４" = some 704 := by decide
example : parseDigits "００７０５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００７０５" := by decide
example : parseDigits "００７０５" = some 705 := by decide
example : parseDigits "００７０６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "００７０６" := by decide
example : parseDigits "００７０６" = some 706 := by decide
example : parseDigits "１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１" := by decide
example : parseDigits "１" = some 1 := by decide
example : parseDigits "１０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０" := by decide
example : parseDigits "１０" = some 10 := by decide
example : parseDigits "１０３５５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０３５５" := by decide
example : parseDigits "１０３５５" = some 10355 := by decide
example : parseDigits "１０３６１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０３６１" := by decide
example : parseDigits "１０３６１" = some 10361 := by decide
example : parseDigits "１０４３４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０４３４" := by decide
example : parseDigits "１０４３４" = some 10434 := by decide
example : parseDigits "１０４３５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０４３５" := by decide
example : parseDigits "１０４３５" = some 10435 := by decide
example : parseDigits "１０４６０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０４６０" := by decide
example : parseDigits "１０４６０" = some 10460 := by decide
example : parseDigits "１０５０３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５０３" := by decide
example : parseDigits "１０５０３" = some 10503 := by decide
example : parseDigits "１０５０４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５０４" := by decide
example : parseDigits "１０５０４" = some 10504 := by decide
example : parseDigits "１０５０５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５０５" := by decide
example : parseDigits "１０５０５" = some 10505 := by decide
example : parseDigits "１０５０６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５０６" := by decide
example : parseDigits "１０５０６" = some 10506 := by decide
example : parseDigits "１０５２２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５２２" := by decide
example : parseDigits "１０５２２" = some 10522 := by decide
example : parseDigits "１０５２３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５２３" := by decide
example : parseDigits "１０５２３" = some 10523 := by decide
example : parseDigits "１０５２４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５２４" := by decide
example : parseDigits "１０５２４" = some 10524 := by decide
example : parseDigits "１０５３５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５３５" := by decide
example : parseDigits "１０５３５" = some 10535 := by decide
example : parseDigits "１０５３９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５３９" := by decide
example : parseDigits "１０５３９" = some 10539 := by decide
example : parseDigits "１０５７３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５７３" := by decide
example : parseDigits "１０５７３" = some 10573 := by decide
example : parseDigits "１０５７４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５７４" := by decide
example : parseDigits "１０５７４" = some 10574 := by decide
example : parseDigits "１０５９８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５９８" := by decide
example : parseDigits "１０５９８" = some 10598 := by decide
example : parseDigits "１０５９９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０５９９" := by decide
example : parseDigits "１０５９９" = some 10599 := by decide
example : parseDigits "１０６００" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０６００" := by decide
example : parseDigits "１０６００" = some 10600 := by decide
example : parseDigits "１０６０１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０６０１" := by decide
example : parseDigits "１０６０１" = some 10601 := by decide
example : parseDigits "１０６０２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０６０２" := by decide
example : parseDigits "１０６０２" = some 10602 := by decide
example : parseDigits "１０６０３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１０６０３" := by decide
example : parseDigits "１０６０３" = some 10603 := by decide
example : parseDigits "１１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１１" := by decide
example : parseDigits "１１" = some 11 := by decide
example : parseDigits "１２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１２" := by decide
example : parseDigits "１２" = some 12 := by decide
example : parseDigits "１３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１３" := by decide
example : parseDigits "１３" = some 13 := by decide
example : parseDigits "１４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１４" := by decide
example : parseDigits "１４" = some 14 := by decide
example : parseDigits "１５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１５" := by decide
example : parseDigits "１５" = some 15 := by decide
example : parseDigits "１６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１６" := by decide
example : parseDigits "１６" = some 16 := by decide
example : parseDigits "１７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１７" := by decide
example : parseDigits "１７" = some 17 := by decide
example : parseDigits "１８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１８" := by decide
example : parseDigits "１８" = some 18 := by decide
example : parseDigits "１９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "１９" := by decide
example : parseDigits "１９" = some 19 := by decide
example : parseDigits "２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２" := by decide
example : parseDigits "２" = some 2 := by decide
example : parseDigits "２０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２０" := by decide
example : parseDigits "２０" = some 20 := by decide
example : parseDigits "２１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２１" := by decide
example : parseDigits "２１" = some 21 := by decide
example : parseDigits "２２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２２" := by decide
example : parseDigits "２２" = some 22 := by decide
example : parseDigits "２３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２３" := by decide
example : parseDigits "２３" = some 23 := by decide
example : parseDigits "２４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２４" := by decide
example : parseDigits "２４" = some 24 := by decide
example : parseDigits "２５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２５" := by decide
example : parseDigits "２５" = some 25 := by decide
example : parseDigits "２６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２６" := by decide
example : parseDigits "２６" = some 26 := by decide
example : parseDigits "２７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２７" := by decide
example : parseDigits "２７" = some 27 := by decide
example : parseDigits "２８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２８" := by decide
example : parseDigits "２８" = some 28 := by decide
example : parseDigits "２９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "２９" := by decide
example : parseDigits "２９" = some 29 := by decide
example : parseDigits "３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３" := by decide
example : parseDigits "３" = some 3 := by decide
example : parseDigits "３０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３０" := by decide
example : parseDigits "３０" = some 30 := by decide
example : parseDigits "３００" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３００" := by decide
example : parseDigits "３００" = some 300 := by decide
example : parseDigits "３１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３１" := by decide
example : parseDigits "３１" = some 31 := by decide
example : parseDigits "３２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３２" := by decide
example : parseDigits "３２" = some 32 := by decide
example : parseDigits "３３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３３" := by decide
example : parseDigits "３３" = some 33 := by decide
example : parseDigits "３４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３４" := by decide
example : parseDigits "３４" = some 34 := by decide
example : parseDigits "３５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３５" := by decide
example : parseDigits "３５" = some 35 := by decide
example : parseDigits "３６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３６" := by decide
example : parseDigits "３６" = some 36 := by decide
example : parseDigits "３７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３７" := by decide
example : parseDigits "３７" = some 37 := by decide
example : parseDigits "３８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３８" := by decide
example : parseDigits "３８" = some 38 := by decide
example : parseDigits "３９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "３９" := by decide
example : parseDigits "３９" = some 39 := by decide
example : parseDigits "４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４" := by decide
example : parseDigits "４" = some 4 := by decide
example : parseDigits "４０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４０" := by decide
example : parseDigits "４０" = some 40 := by decide
example : parseDigits "４１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４１" := by decide
example : parseDigits "４１" = some 41 := by decide
example : parseDigits "４２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４２" := by decide
example : parseDigits "４２" = some 42 := by decide
example : parseDigits "４３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４３" := by decide
example : parseDigits "４３" = some 43 := by decide
example : parseDigits "４４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４４" := by decide
example : parseDigits "４４" = some 44 := by decide
example : parseDigits "４５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４５" := by decide
example : parseDigits "４５" = some 45 := by decide
example : parseDigits "４６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４６" := by decide
example : parseDigits "４６" = some 46 := by decide
example : parseDigits "４７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４７" := by decide
example : parseDigits "４７" = some 47 := by decide
example : parseDigits "４８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４８" := by decide
example : parseDigits "４８" = some 48 := by decide
example : parseDigits "４９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "４９" := by decide
example : parseDigits "４９" = some 49 := by decide
example : parseDigits "５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５" := by decide
example : parseDigits "５" = some 5 := by decide
example : parseDigits "５０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５０" := by decide
example : parseDigits "５０" = some 50 := by decide
example : parseDigits "５１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５１" := by decide
example : parseDigits "５１" = some 51 := by decide
example : parseDigits "５２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５２" := by decide
example : parseDigits "５２" = some 52 := by decide
example : parseDigits "５３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５３" := by decide
example : parseDigits "５３" = some 53 := by decide
example : parseDigits "５４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５４" := by decide
example : parseDigits "５４" = some 54 := by decide
example : parseDigits "５５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５５" := by decide
example : parseDigits "５５" = some 55 := by decide
example : parseDigits "５６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５６" := by decide
example : parseDigits "５６" = some 56 := by decide
example : parseDigits "５７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５７" := by decide
example : parseDigits "５７" = some 57 := by decide
example : parseDigits "５８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５８" := by decide
example : parseDigits "５８" = some 58 := by decide
example : parseDigits "５９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "５９" := by decide
example : parseDigits "５９" = some 59 := by decide
example : parseDigits "６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６" := by decide
example : parseDigits "６" = some 6 := by decide
example : parseDigits "６０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６０" := by decide
example : parseDigits "６０" = some 60 := by decide
example : parseDigits "６１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６１" := by decide
example : parseDigits "６１" = some 61 := by decide
example : parseDigits "６２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６２" := by decide
example : parseDigits "６２" = some 62 := by decide
example : parseDigits "６３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６３" := by decide
example : parseDigits "６３" = some 63 := by decide
example : parseDigits "６４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６４" := by decide
example : parseDigits "６４" = some 64 := by decide
example : parseDigits "６５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６５" := by decide
example : parseDigits "６５" = some 65 := by decide
example : parseDigits "６６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６６" := by decide
example : parseDigits "６６" = some 66 := by decide
example : parseDigits "６７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６７" := by decide
example : parseDigits "６７" = some 67 := by decide
example : parseDigits "６８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６８" := by decide
example : parseDigits "６８" = some 68 := by decide
example : parseDigits "６９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "６９" := by decide
example : parseDigits "６９" = some 69 := by decide
example : parseDigits "７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７" := by decide
example : parseDigits "７" = some 7 := by decide
example : parseDigits "７０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７０" := by decide
example : parseDigits "７０" = some 70 := by decide
example : parseDigits "７１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７１" := by decide
example : parseDigits "７１" = some 71 := by decide
example : parseDigits "７２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７２" := by decide
example : parseDigits "７２" = some 72 := by decide
example : parseDigits "７３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７３" := by decide
example : parseDigits "７３" = some 73 := by decide
example : parseDigits "７４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７４" := by decide
example : parseDigits "７４" = some 74 := by decide
example : parseDigits "７５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７５" := by decide
example : parseDigits "７５" = some 75 := by decide
example : parseDigits "７６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７６" := by decide
example : parseDigits "７６" = some 76 := by decide
example : parseDigits "７７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７７" := by decide
example : parseDigits "７７" = some 77 := by decide
example : parseDigits "７８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７８" := by decide
example : parseDigits "７８" = some 78 := by decide
example : parseDigits "７９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "７９" := by decide
example : parseDigits "７９" = some 79 := by decide
example : parseDigits "８" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８" := by decide
example : parseDigits "８" = some 8 := by decide
example : parseDigits "８０" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８０" := by decide
example : parseDigits "８０" = some 80 := by decide
example : parseDigits "８１" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８１" := by decide
example : parseDigits "８１" = some 81 := by decide
example : parseDigits "８２" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８２" := by decide
example : parseDigits "８２" = some 82 := by decide
example : parseDigits "８３" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８３" := by decide
example : parseDigits "８３" = some 83 := by decide
example : parseDigits "８４" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８４" := by decide
example : parseDigits "８４" = some 84 := by decide
example : parseDigits "８５" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８５" := by decide
example : parseDigits "８５" = some 85 := by decide
example : parseDigits "８６" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８６" := by decide
example : parseDigits "８６" = some 86 := by decide
example : parseDigits "８７" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "８７" := by decide
example : parseDigits "８７" = some 87 := by decide
example : parseDigits "９" = JapanTaxLaw.BareLabelFragmentsSpec.parseDigitsSpec "９" := by decide
example : parseDigits "９" = some 9 := by decide

end JapanTaxLaw.BareLabelFragmentsTests
