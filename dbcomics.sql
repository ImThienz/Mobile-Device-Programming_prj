-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 17, 2024 lúc 01:24 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dataonline`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE chitietdonhang (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO chitietdonhang (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
('11','5','1','99000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE donhang (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `diachi` text NOT NULL,
  `sodienthoai` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `tongtien` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO donhang (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`) VALUES
('16','7','14 nguyen du','0123456789','vtdhnv@gmail.com','11','1791000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE sanpham (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL)
 ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO sanpham (`id`, `tensanpham`, `hinhanh`) VALUES
(0, 'Trang chủ ', 'https://vi.seaicons.com/wp-content/uploads/2017/04/home-icon3.png'),
(1, 'Truyện Isekai', 'https://upload.wikimedia.org/wikipedia/vi/5/56/Isekai_Quartet_art.jpg'),
(2, 'Truyện Action', 'https://static2.vieon.vn/vieplay-image/poster_v4/2023/10/06/y8xah1qo_660x946-spyxfamily-3_360_534.jpeg'),
(3, 'Truyện Romcom', 'https://i7.bumcheo.info/manga/28/28414/cover-romcom.thumb_500x.jpg'),
(4, 'Truyện Shounen', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/e/e0/Jujutsu_Kaisen_Cursed_Clash_Key_Visual.png/revision/latest?cb=20230702024226'),
(8, 'Đơn Hàng', 'https://e7.pngegg.com/pngimages/860/464/png-clipart-shopping-cart-software-button-e-commerce-computer-icons-online-shopping-button-blue-angle-thumbnail.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphammoi`
--

CREATE TABLE sanphammoi (
  `id` int(11) NOT NULL,
  `tensp` varchar(250) NOT NULL,
  `giasp` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL,
  `mota` text NOT NULL,
  `loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphammoi
--

INSERT INTO `sanphammoi` (`id`, `tensp`, `giasp`, `hinhanh`, `mota`, `loai`) VALUES
(1, 'Jujutsu Kaisen', '50000', 'https://upload.wikimedia.org/wikipedia/vi/8/82/Jujutsu_Kaisen_vol_1_cover.jpeg', 'Trong vũ trụ Chú thuật hồi chiến, tất cả sinh vật sống đều phát ra một loại năng lượng được gọi là chú lực, sinh ra từ cảm xúc tiêu cực chảy đều trong cơ thể. Những người bình thường không thể kiểm soát được dòng chảy này trong cơ thể họ. Hậu quả là họ để cho chú lực phát tán ra ngoài, hình thành nên nguyền hồn, một chủng sinh vật có dã tâm làm chuyện tai ác với nhân loại. Nguyền hồn xuất hiện dưới hình thù những con quái vật ghê rợn.\n\nChú thuật sư là những người có khả năng kiểm soát dòng chảy chú lực trong cơ thể họ, cho phép họ sử dụng chú lực theo ý muốn cũng như giảm thiểu sự phát tán của nó. Chú thuật sư và nguyền hồn cấp cao có thể tinh luyện loại năng lượng này và sử dụng nó để thực hiện chú thuật thức. Loại thuật thức này dường như là đặc thù với mỗi cá nhân hoặc gia tộc của họ. Bành trướng lĩnh vực là một dạng nâng cấp của chú thuật thức, qua đó chú thuật sư có thể sử dụng chú lực để tạo dựng nên một kết giới bao trùm khu vực xung quanh. Trong kết giới đó, mọi đòn tấn công của người sử dụng nó trở nên mạnh hơn.', 4),
(2, 'Mushoku Tensei', '80000', 'https://comichub.blob.core.windows.net/high/def8df4a-625a-43bc-9679-fea2bd84ece2.jpg', 'Một otaku thất nghiệp vừa chạm đến điểm thấp nhất trong cuộc đời. Anh ấy không muốn gì hơn ngoài khả năng bắt đầu lại, nhưng đúng như anh ấy nghĩ điều đó có thể xảy ra… anh ấy bị một chiếc xe tải đâm và chết! Ngạc nhiên thay, anh thấy mình tái sinh trong cơ thể một đứa trẻ sơ sinh trong một thế giới mới kỳ lạ của kiếm và ma thuật. Danh tính của anh ấy bây giờ là Rudeus Greyrat, nhưng anh ấy vẫn giữ được ký ức về kiếp trước. Tái sinh trong một gia đình mới, Rudeus tận dụng những kinh nghiệm trong quá khứ của mình để tiến lên trong thế giới giả tưởng này với tư cách là một thần đồng thực sự có năng khiếu trưởng thành hơn tuổi và tài năng phép thuật bẩm sinh. Với kiếm thay vì đũa và sách bùa chú thay vì Internet, liệu Rudeus có thể chuộc lỗi ở vùng đất kỳ diệu nhưng nguy hiểm này không?', 1),
(3, 'SPY X FAMILY', '75000', 'https://upload.wikimedia.org/wikipedia/vi/thumb/0/07/B%C3%ACa_manga_Spy_%C3%97_Family_t%E1%BA%ADp_1_thu%E1%BB%99c_nh%C3%A0_xu%E1%BA%A5t_b%E1%BA%A3n_Kim_%C4%90%E1%BB%93ng.jpg/220px-B%C3%ACa_manga_Spy_%C3%97_Family_t%E1%BA%ADp_1_thu%E1%BB%99c_nh%C3%A0_xu%E1%BA%A5t_b%E1%BA%A3n_Kim_%C4%90%E1%BB%93ng.jpg', 'Câu chuyện kể về một điệp viên của \"Tây Quốc\" Westalis (西国ウェスタリス) có mật danh là \"Hoàng hôn\", cố gắng xây dựng một \"gia đình kiểu mẫu\" nhằm thu thập thông tin tình báo tại nước đối địch, \"Đông Quốc\" Ostania (東国オスタニア)', 2),
(4, 'Detective Conan', '40000', 'https://m.media-amazon.com/images/I/915K9WhpM5L._AC_UF1000,1000_QL80_.jpg', 'Conan Edogawa (江戸川 コナン Edogawa Konan?) là tên được dùng bởi Shinichi Kudo trong bộ dạng thu nhỏ. Shinichi bị thu nhỏ thành cậu bé 6,7 tuổi sau khi bị buộc uống một mẫu thuốc độc thử nghiệm gọi là APTX 4869 bởi 2 người đàn ông áo đen, sau này được biết chúng là thành viên của Tổ chức Áo đen.', 2),
(5, 'Tonikaku Kawaii', '80000', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfbqoL7_mJR0kOYATY9ru5SaUUSLSPbQcVhA&s', 'Yuzaki Nasa, bị một chiếc xe tải đâm vào ngày thi vào trường trung học. Anh gặp và theo dõi một cô gái xinh đẹp vừa cứu anh, thổ lộ tình yêu của anh dành cho cô tại một trạm xe buýt. Cô gái ấy, Tsukuyomi Tsukasa, đồng ý trở thành bạn gái của anh, nhưng với điều kiện là họ phải kết hôn trước. Khi Nasa, trước đây đã quyết định không học cao trung, đến sinh nhật lần thứ 18, anh vẫn đang suy nghĩ về lời hứa vào ngày hôm đó. Đột nhiên, Tsukasa xuất hiện ở ngưỡng cửa nhà của anh với một tờ đơn kết hôn, bắt đầu mối quan hệ hôn nhân của họ. Mặc dù em gái nuôi của Tsukasa không chịu chấp nhận mối quan hệ này, Tsukasa vẫn dẫn Nasa đến gặp gia đình cô. Khi mối quan hệ của Nasa và Tsukasa phát triển, họ bắt đầu trở nên thân thiết hơn. Cặp đôi bắt đầu nắm tay, ôm nhau và hôn nhau cho đến Chương 14. Xuyên suốt các chương trước của manga, một nhân vật phụ tên là Arisugawa Aya, người đã phải lòng Nasa, tin rằng Nasa và Tsukasa chỉ đơn giản là thành viên trong gia đình, không kết hôn. Khi cô biết rằng họ là vợ chồng, cô đã phải chịu một cú sốc nhưng cuối cùng đành đồng ý và ủng hộ mối quan hệ của Nasa.', 3),
(6, 'Dragon Ball', '50000', 'https://product.hstatic.net/200000343865/product/dragon-ball-z-cuoc-chien-giua-cac-vi-than_bia_25b280637e55456da370269fcc2e66c8_master.jpg', 'Một cậu bé sơ sinh có đuôi khỉ được tìm thấy bởi một ông lão sống một mình trong rừng, ông đặt tên là Son Goku và xem đứa bé như là cháu của mình. Goku có sức mạnh vượt trội người thường, sau khi ông lão qua đời thì cậu sống một mình. Một ngày nọ Goku tình cờ gặp một cô gái tên là Bulma trên đường đi bắt cá về, Goku và Bulma đã cùng nhau truy tìm bảy viên ngọc rồng. Các viên ngọc rồng này chứa đựng một bí mật có thể triệu hồi một con rồng và ban điều ước cho ai sở hữu chúng. Trên cuộc hành trình dài đi tìm những viên ngọc rồng, họ gặp những người bạn và những đấu sĩ huyền thoại cũng như nhiều ác quỷ. Họ trải qua những khó khăn và học hỏi các chiêu thức võ thuật đặc biệt để tham gia thi đấu trong đại hội võ thuật thế giới được tổ chức hằng năm.', 4),
(7, 'Mushoku Tensei N1', '80000', 'https://upload.wikimedia.org/wikipedia/vi/3/32/Mushoku_Tensei_1.jpeg', 'Một tên NEET 34 tuổi đã bị đuổi khỏi nhà sau cái chết của cha mẹ hắn vì không tổ chức tang lễ. Hắn ngăn chặn một nhóm người thiếu niên ra khỏi một chiếc xe tải đang chạy và đã đẩy một người trong nhóm người đó ra thành công trước khi hắn chết. Tỉnh dậy trong cơ thể của một đứa trẻ, hắn nhận ra mình đã được chuyển sinh tới thế giới của kiếm, phép thuật và các bộ tộc kỳ lạ. Trong khi hắn vẫn giữ lại cái tính biến thái (không hẳn), hắn quyết tâm sẽ trở nên thành công ở cuộc sống mới, với cái tên Rudeus Greyrat (một số nhân vật trong Mushoku Tensei có họ là tên con vật kết hợp với màu sắc). Bởi vì tính cách năng động và rèn luyện ở tuổi trẻ, Rudeus trở nên điêu luyện với phép thuật. Trong khi còn nhỏ, cậu trở thành học sinh của Roxy Migurdia, bạn của Sylphiette, và là giáo viên của Eris Boreas Greyrat. Sau đó, thảm họa dịch chuyển đã chia cắt mọi người trên khắp thế giới, và Rudeus quyết tâm sẽ đưa Eris về nhà. Cuộc hành trình của cậu bắt đầu, Rudeus nhận được lời khuyên từ một vật thể tự xưng là Nhân Thần và làm bạn với Ruijerd Supardia (Tộc nhân Superd). Sau khi đưa Eris về nhà thành công, sự hiểu nhầm của Rudeus đã khiến tim cậu tan nát.', 2),
(8, 'ONE PIECE', '50000', 'https://cdnntx.com/nettruyen/thumb/one-piece.jpg', 'One Piece là câu truyện kể về Luffy và các thuyền viên của mình. Khi còn nhỏ, Luffy ước mơ trở thành Vua Hải Tặc. Cuộc sống của cậu bé thay đổi khi cậu vô tình có được sức mạnh có thể co dãn như cao su, nhưng đổi lại, cậu không bao giờ có thể bơi được nữa. Giờ đây, Luffy cùng những người bạn hải tặc của mình ra khơi tìm kiếm kho báu One Piece, kho báu vĩ đại nhất trên thế giới. Trong One Piece, mỗi nhân vật trong đều mang một nét cá tính đặc sắc kết hợp cùng các tình huống kịch tính, lối dẫn truyện hấp dẫn chứa đầy các bước ngoặt bất ngờ và cũng vô cùng hài hước đã biến One Piece trở thành một trong những bộ truyện nổi tiếng nhất không thể bỏ qua. Hãy đọc One Piece để hòa mình vào một thế giới của những hải tặc rộng lớn, đầy màu sắc, sống động và thú vị, cùng đắm chìm với những nhân vật yêu tự do, trên hành trình đi tìm ước mơ của mình.', 2),
(9, 'Detective Conan V94', '65000', 'https://www.theanimex.com/wp-content/uploads/2017/12/71wzoruNqsL.jpg.webp', 'Shinichi Kudo, con trai của một nhà văn bí ẩn nổi tiếng thế giới, là một thám tử trung học, người đã phá được nhiều vụ án khó hiểu nhất. Một ngày nọ, khi đang hẹn hò với người bạn thời thơ ấu Ran Moore, Shinichi quan sát thấy một cặp người đàn ông mặc đồ đen đang tham gia vào một hoạt động kinh doanh mờ ám nào đó. Những người đàn ông bắt Shinichi và đưa cho anh một chất độc để xoa dịu nhân chứng của họ. Nhưng thay vì giết anh ta, nó lại biến anh ta thành một đứa trẻ! Shinichi lấy bút danh Conan Edogawa và tiếp tục giải quyết mọi vụ án khó khăn xảy đến với mình. Trong suốt thời gian đó, anh ấy đang tìm kiếm những người mặc đồ đen và tổ chức bí ẩn mà họ tham gia để tìm ra phương pháp chữa trị căn bệnh nhỏ của mình.', 2),
(10, 'Tonikaku Kawaii V16', '125000', 'https://m.media-amazon.com/images/I/71gR3DMt-QL._SY466_.jpg', 'Kể từ ngày cha mẹ đặt tên cho mình, Nasa Yuzaki đã cảm thấy được kết nối với không gian vũ trụ…dù anh có thích hay không. Những nỗ lực của anh để vượt trội hơn chương trình không gian đã đi chệch hướng khi một tai nạn giới thiệu anh với Tsukasa, một cô gái bí ẩn có sức mạnh kỳ lạ. Cô ấy là người ngoài hành tinh, nữ thần mặt trăng hay cái gì khác? Vì cô nhất quyết muốn cưới anh nên Nasa sẽ có rất nhiều cơ hội để tìm hiểu! \n Cuối cùng sự thật về quá khứ của Tsukasa cũng được tiết lộ. Theo dõi hành trình dài của cô khi cô thoát khỏi cái chết, chiến đấu vì tự do, mơ về mặt trăng xa xôi và cuối cùng, sau nhiều thế kỷ tìm kiếm, cô đã tìm thấy tình yêu. Sau tất cả những điều đó, có lẽ đã đến lúc ra ngoài ăn tối và hát karaoke. Một cô gái thỉnh thoảng xứng đáng được nghỉ ngơi.', 3),
(11, 'Dragon Ball Super', '35000', 'https://store.crunchyroll.com/on/demandware.static/-/Sites-crunchyroll-master-catalog/default/dwef08771a/rightstuf/9781974734511_manga-dragon-ball-super-volume-17-primary.jpg', 'Trận chiến giữa Granolah, Goku và Vegeta tiếp tục diễn ra trên hành tinh Ngũ cốc. Mặc dù trận chiến này được thúc đẩy bởi sự dối trá và thao túng của các Heeters, nhưng động lực trả thù cháy bỏng của Granolah đã khiến anh tin rằng đây là một cuộc chiến đáng chết - và đó chính xác là những gì các Heeters mong muốn. \n Cảm thấy có điều gì đó không ổn, Vegeta bắt đầu xâu chuỗi bí ẩn về lý do tại sao Granola lại ghét người Saiyan đến vậy. Nhưng liệu anh ấy có thể tìm ra sự thật kịp thời? Và liệu Granola có sẵn sàng lắng nghe không?!', 4),
(12, 'Mushoku Tensei N23', '95000', 'https://images.penguinrandomhouse.com/cover/9781685796457', 'Đứa con thứ tư của Rudeus, Sieghart, được sinh ra với mái tóc màu xanh lá cây tươi sáng giống như Laplace từng lo sợ. Điềm báo càng trở nên tồi tệ hơn khi một người quen của Perugius xuất hiện và ra lệnh cho Rudeus đưa đứa con trai mới sinh của mình đến pháo đài nổi! Rudeus thề rằng kế hoạch chiến đấu với Laplace của anh ấy là không thay đổi và anh ấy sẽ chấp nhận mọi số phận vì lợi ích của gia đình mình… nhưng liệu điều đó có đủ với Perugius không?', 1),
(13, 'SPY X FAMILY P6', '75000', 'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781974725137/spy-x-family-vol-6-9781974725137_lg.jpg', 'Điệp viên bậc thầy Twilight là vô song khi bí mật thực hiện các nhiệm vụ nguy hiểm vì sự phát triển của thế giới. Nhưng khi anh ấy nhận được nhiệm vụ quan trọng nhất—kết hôn và sinh con—cuối cùng anh ấy có thể gặp khó khăn! \n Twilight and Nightfall tham gia một giải đấu quần vợt dưới lòng đất, với hy vọng có được cơ hội lấy được tài liệu tình báo có nguy cơ đưa thế giới đến bờ vực chiến tranh! Nhưng liệu nhiệm vụ của họ có bị ảnh hưởng bởi mối tình bí mật của Nightfall với Twilight?!', 2),
(14, 'Goblin Slayer', '266000', 'https://waltscomicshop.com/cdn/shop/products/goblin-slayer-gn-vol-01-580907.jpg?v=1696023311&width=333', 'Tất cả thể loại bạn thích về Dark Fantasy đều có trong bộ truyện này...',4 ),
(15, 'Mato seihei no slave', '80000', 'https://i.ebayimg.com/images/g/T0wAAOSwkmNl5glM/s-l1600.webp', 'kể về những cuộc chiến chống lại những con quỷ ở trong Ma đô (Thành phố ma thuật). Cùng tác giả với Akame ga Kill', 2);
(16, 'KỊCH TRƯỜNG CỦA TAKEMICHI', '70000', 'https://m.media-amazon.com/images/I/81D+Hi+HNKL._AC_UY327_FMwebp_QL65_.jpg', 'Tên khác: Tokyo Manji Revengers Tokyo Revengers Toukyou Revengers 東京卍リベンジャーズ Takemichi, thanh niên thất nghiệp còn trinh, được biết rằng người con gái đầu tiên và cũng là duy nhất cho đến bây giờ mà anh hẹn hò từ trung học đã chết. Sau một vụ tai nạn, anh ta thấy mình được quay về những ngày cấp hai. Anh ta thề sẽ thay đổi tương lai và giữ lấy người con gái ấy, để làm việc đó, anh ta quyết định sẽ vươn lên làm trùm băng đảng khét tiếng nhất ở vùng Kantou.',4 ),
(17, 'DỊCH VỤ CHO THUÊ BẠN GÁI', '125.100', 'https://cdn0.fahasa.com/media/catalog/product/9/7/9784065345689.jpg', 'Tác Giả: Miyajima Reiji Quéo Quèo, Biết Mô Tả Thế Nào Đây? Một Thằng Zin Tên Là Kazuya 19 Năm Mới Có Bồ Không Bao Lâu Thì Bị Đá, Thế Là Cậu Ta Phải Sử Dụng Dịch Vụ Hẹn Hò Thuê, Cứ Trả Xiền Là Ngày Đó Bạn Sẽ Có Bạn Gái Ngay! Cậu Ta Đã Thuê Mizuhara Làm Bạn Gái Mình, Cô Nàng Thì Cứ Công Việc (Méo Có Yêu Thương Gì Đâu) Mà Thả Thính, Còn Chàng Ta Thì Đớp Thính Vô Tội Vạ, Cho Đến Khi… Đến Khi Kazuya Bớt Sống Ảo, Cậu Ta Ngưng Đớp Thính Và Tự Sẽ Kiếm Bạn Gái Thật Cho Mình Thì Mới Hớ Ra Mizuhara Học Cùn',2 ),
(18, 'REBUILD WORLD', '180000', 'https://prodimage.images-bn.com/lf?set=key%5Bresolve.pixelRatio%5D,value%5B1%5D&set=key%5Bresolve.width%5D,value%5B600%5D&set=key%5Bresolve.height%5D,value%5B10000%5D&set=key%5Bresolve.imageFit%5D,value%5Bcontainerwidth%5D&set=key%5Bresolve.allowImageUpscaling%5D,value%5B0%5D&set=key%5Bresolve.format%5D,value%5Bwebp%5D&source=url%5Bhttps://prodimage.images-bn.com/pimages/9781718390980_p0_v1_s600x595.jpg%5D&scale=options%5Blimit%5D,size%5B600x10000%5D&sink=format%5Bwebp%5D', 'Cái tên nói lên tất cả, thế giới bị hủy diệt bởi công nghệ hay cái mẹ gì đó éo biết. Main nhà ta là một trong đám sống sót, nhưng đám còn sống lại éo thích chung thuyền, main bị đấm sml và rồi đc 1 cô gái đến cứu. Éo biết cổ là cái mẹ gì luôn nhưng ngon vcđ',4 ),
(19, 'SHUUMATSU NO VALKYRIE', '120000', 'https://cdn0.fahasa.com/media/catalog/product/9/7/9784867201145.jpg', 'Các vị thần mở hội nghị để bàn về sự sống còn của nhân loại. Tất cả đều quyết định "kết liễu" con người, chỉ duy một valkyrie đứng lên phản đối bằng cách đề nghị 1 cuộc chiến giữa thần và người. Cuộc chiến quyết định số phận của nhân loại này sẽ ra sao? Xin mời đón đọc.',2 ),
(20, 'KUCHI GA SAKETEMO KIMI NI WA', '120000', 'https://i.ebayimg.com/images/g/cd4AAOSw3vhkp~yw/s-l960.webp', 'Không Còn Thằng Bé Shota Nữa Mà Thay Vào Đó Là Thanh Niên Cao Trung Hừng Hực Sức Trẻ Với Chụy Khẩu Liệt Nữ, Ơ Mà Cưới Nhau Đi Chứ',3 ),
(21, 'KIMI WA MEIDO-SAMA', '140000', 'https://jpbookstore.com/cdn/shop/products/611pqRtxU7L_1024x1024@2x.jpg?v=1652689566', 'Một cô hầu gái đến nhà Hitoyoshi để tìm việc. Vì tội mê gái mà Hitoyoshi đã cho cô hầu gái này vào nhà. Nhưng sau đó anh main mới phát hiện ra cô hầu gái này là một sát thủ... Đây là câu chuyện về cô hầu gái sát thủ xinh đẹp đi tìm gia đình cho mình.',3 ),
(22, 'SHOUNEN NO ABYSS', '130000', 'https://jpbookstore.com/cdn/shop/products/A1IzzjAYkuL_1024x1024@2x.jpg?v=1663572015', 'Trong một thị trấn nhàm chán và ngày qua ngày không có gì thay đổi, Reiji Kurose, một học sinh trung học, "chỉ" còn sống. Gia đình, ước mơ tương lai, bạn thời thơ ấu. Tất cả đều trói buộc cậu ấy vào thị trấn này. Cậu luôn nghĩ, "Tôi chỉ sống." cho đến khi cô ấy gặp cô ấy. Có hy vọng để sống? Có ánh sáng nào ở phía trước không? The World End Boy Meets Girl bắt đầu',2 ),
(23, 'TÔI LÀ NGƯỜI HÙNG', '60000', 'https://m.media-amazon.com/images/I/51RSM5j85mL._SY445_SX342_.jpg', 'Tôi là người hùng ~ pj kinh dị Bảo đảm không dở, dù 10 chap đầu cực nhảm',2 ),
(24, 'SHINAI NARU BOKU E SATSUI WO KOMETE', '75000', 'https://www.japanzon.com/76175-product_large/the-killer-inside-shinai-naru-boku-e-satsui-wo-komete-vol1-young-magazine-kc-special-japanese-version.jpg', 'Urashima Eiji, một sinh viên đại học, đi ngủ sau một đêm uống rượu vui vẻ với bạn bè. Khi tỉnh dậy, anh phát hiện ra một cô gái xinh đẹp bên cạnh, người đối xử với anh như thể họ đang trong một mối quan hệ yêu đương. Sau đó, anh phát hiện ra rằng 4 ngày đã trôi qua kể từ khi anh đi ra ngoài cùng với đám bạn của mình. Anh ấy đã làm gì trong suốt thời gian đó và tại sao anh ấy không có ký ức về nó?. Khi đối mặt với thực tế đó, anh sẽ bị cuốn vào bi kịch ...',4 ),
(25, 'SHINIGAMI BOCCHAN TO KURO MAID', '80000', 'https://cdn0.fahasa.com/media/catalog/product/9/7/9784091280992.jpg', '1 chàng trai mang lời nguyền chạm đâu chết đó và cô hầu gái của cậu',3 ),
(26, 'YUUSHA GA SHINDA!', '90.000', 'https://pictures.abebooks.com/isbn/9784091261397-us.jpg', 'Sion Bladen đã phong ấn Quỷ vương và quân đội của hắn tại Cổng địa ngục. Giờ đây, khi Quỷ vương đã sẵn sàng trỗi dậy trở lại, Sion quay trở lại trận chiến để đối mặt với kẻ thù không đội trời chung của mình. Thật không may, cuối cùng anh ta lại bị giết trong một cái bẫy do người nông dân Touka Scott đào, người đang cố gắng tự vệ khỏi lũ quỷ. Không còn lựa chọn nào khác, pháp sư chiêu hồn Anri Haysworth đưa linh hồn biến thái của Touka vào cơ thể đã chết của Sion để đóng giả anh ta. Cùng với người bạn thời thơ ấu của Touka là Yuna Eunice, ba anh hùng không phù hợp phải vượt qua thử thách và phong ấn Cổng Địa ngục.',4 ),
(27, 'TATE NO YUUSHA NO NARIAGARI 9', '203.000', 'https://cdn0.fahasa.com/media/catalog/product/i/m/image_145443.jpg', 'Iwatani Naofumi bị triệu hồi đến một thế giới khác cùng với 3 người khác để trở thành những anh hùng của thế giới đó. Mỗi người họ đều được trang bị từng vũ khí huyền thoại riêng biệt khi bị triệu hồi. Naofumi tình cờ nhận được chiếc khiên huyền thoại làm vũ khí. Nhưng do sự thiếu uy tín cũng như kinh nghiệm của mình, rốt cuộc cậu chỉ có được duy nhất một người đồng đôi trong khi những anh hùng khác lại có đến vài người',1 ),
(28, 'Goblin Slayer', '300000', 'https://m.media-amazon.com/images/I/91HLjQI2cmL._SL1500_.jpg', 'Một nữ tu sĩ trẻ đã thành lập nhóm phiêu lưu đầu tiên của mình, nhưng gần như ngay lập tức họ thấy mình gặp nạn. Đó là Goblin Slayer đến để giải cứu họ - một người đàn ông đã cống hiến cuộc đời mình để tiêu diệt tất cả Goblin, bằng mọi cách cần thiết. Và khi tin đồn về chiến công của anh ấy bắt đầu lan truyền, không biết ai có thể gọi tiếp theo...',2 ),
(29, 'WIND BREAKER', '166.000', 'https://cdn0.fahasa.com/media/catalog/product/9/7/9784065229798.jpg', 'Nhân vật chính của Wind Breaker là Haruka, một nam sinh chỉ có ước mơ trở thành người mạnh nhất trong số những kẻ mạnh. Sau khi nhập học tại trường Furin, Haruka nhận ra rằng những kẻ mạnh tại ngôi trường này sử dụng sức mạnh của họ để bảo vệ thành phố. Điều này dẫn Haruka vào một cuộc hành trình mà cậu không thể ngờ đến.',2 ),
(30, 'TOKYO REVENGERS', '200.000', 'https://m.media-amazon.com/images/I/91fvgvLqJML._SY385_.jpg', 'Xem tin tức, Takemichi Hanagaki biết rằng bạn gái của mình từ thời trung học, Hinata Tachibana, đã qua đời. Người bạn gái duy nhất mà anh từng có vừa bị giết bởi một nhóm phản diện được gọi là Tokyo Manji Gang. Anh ta sống trong một căn hộ tồi tàn với những bức tường mỏng, và ông chủ trẻ hơn sáu tuổi của anh ta đối xử với anh ta như một thằng ngốc. Thêm vào đó, anh ấy là một trinh nữ hoàn chỉnh và hoàn toàn... Ở đỉnh cao của cuộc đời dưới đáy đá, anh ấy đột nhiên nhảy vọt thời gian 12 năm trở lại những ngày học cấp hai !! Để cứu Hinata, và thay đổi cuộc sống mà anh ta đã bỏ trốn, Takemichi bán thời gian vô vọng phải nhắm đến đỉnh cao của băng đảng tội phạm nham hiểm nhất Kanto !!',1);
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE user (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `mobile` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO user (`id`, `email`, `pass`, `username`, `mobile`) VALUES
(2, 'vtdhnv@gmail.com', '123', 'vthdat', '0842596707'),
(5, 'test1@gmail.com', '123', 'dat', '0123456789'),
(6, '2254810175@vaa.edu.vn', '123', 'datvuthanh', '0842596707');
--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE donhang
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE sanpham
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanphammoi`
--
ALTER TABLE sanphammoi
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE user
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE donhang
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE sanpham
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `sanphammoi`
--
ALTER TABLE sanphammoi
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE user
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
