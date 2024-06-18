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

CREATE TABLE `chitietdonhang` (
  `iddonhang` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES
('11','5','1','99000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
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

INSERT INTO `donhang` (`id`, `iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`) VALUES
('16','7','14 nguyen du','0123456789','vtdhnv@gmail.com','11','1791000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensanpham`, `hinhanh`) VALUES
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

CREATE TABLE `sanphammoi` (
  `id` int(11) NOT NULL,
  `tensp` varchar(250) NOT NULL,
  `giasp` varchar(100) NOT NULL,
  `hinhanh` text NOT NULL,
  `mota` text NOT NULL,
  `loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphammoi`
--

INSERT INTO `sanphammoi` (`id`, `tensp`, `giasp`, `hinhanh`, `mota`, `loai`) VALUES
(1, 'Jujutsu Kaisen', '50000', 'https://upload.wikimedia.org/wikipedia/vi/8/82/Jujutsu_Kaisen_vol_1_cover.jpeg', 'Trong vũ trụ Chú thuật hồi chiến, tất cả sinh vật sống đều phát ra một loại năng lượng được gọi là chú lực, sinh ra từ cảm xúc tiêu cực chảy đều trong cơ thể. Những người bình thường không thể kiểm soát được dòng chảy này trong cơ thể họ. Hậu quả là họ để cho chú lực phát tán ra ngoài, hình thành nên nguyền hồn, một chủng sinh vật có dã tâm làm chuyện tai ác với nhân loại. Nguyền hồn xuất hiện dưới hình thù những con quái vật ghê rợn.\n\nChú thuật sư là những người có khả năng kiểm soát dòng chảy chú lực trong cơ thể họ, cho phép họ sử dụng chú lực theo ý muốn cũng như giảm thiểu sự phát tán của nó. Chú thuật sư và nguyền hồn cấp cao có thể tinh luyện loại năng lượng này và sử dụng nó để thực hiện chú thuật thức. Loại thuật thức này dường như là đặc thù với mỗi cá nhân hoặc gia tộc của họ. Bành trướng lĩnh vực là một dạng nâng cấp của chú thuật thức, qua đó chú thuật sư có thể sử dụng chú lực để tạo dựng nên một kết giới bao trùm khu vực xung quanh. Trong kết giới đó, mọi đòn tấn công của người sử dụng nó trở nên mạnh hơn.', 4),
(2, 'Mushoku Tensei', '80000', 'https://comichub.blob.core.windows.net/high/def8df4a-625a-43bc-9679-fea2bd84ece2.jpg', 'Câu chuyện kể về một thanh niên thất nghiệp thiếu hi vọng, bị đuổi ra khỏi nhà ngay vào lễ tang của cha mẹ và chết trong vụ tai nạn bất ngờ. Sau đó được chuyển sinh đến một thế giới giả tưởng, lần này anh quyết định sống một cuộc đời nghiêm túc.', 1),
(3, 'SPY X FAMILY', '75000', 'https://upload.wikimedia.org/wikipedia/vi/thumb/0/07/B%C3%ACa_manga_Spy_%C3%97_Family_t%E1%BA%ADp_1_thu%E1%BB%99c_nh%C3%A0_xu%E1%BA%A5t_b%E1%BA%A3n_Kim_%C4%90%E1%BB%93ng.jpg/220px-B%C3%ACa_manga_Spy_%C3%97_Family_t%E1%BA%ADp_1_thu%E1%BB%99c_nh%C3%A0_xu%E1%BA%A5t_b%E1%BA%A3n_Kim_%C4%90%E1%BB%93ng.jpg', 'Câu chuyện kể về một điệp viên của \"Tây Quốc\" Westalis (西国ウェスタリス) có mật danh là \"Hoàng hôn\", cố gắng xây dựng một \"gia đình kiểu mẫu\" nhằm thu thập thông tin tình báo tại nước đối địch, \"Đông Quốc\" Ostania (東国オスタニア)', 2),
(4, 'Detective Conan', '40000', 'https://m.media-amazon.com/images/I/915K9WhpM5L._AC_UF1000,1000_QL80_.jpg', 'Conan Edogawa (江戸川 コナン Edogawa Konan?) là tên được dùng bởi Shinichi Kudo trong bộ dạng thu nhỏ. Shinichi bị thu nhỏ thành cậu bé 6,7 tuổi sau khi bị buộc uống một mẫu thuốc độc thử nghiệm gọi là APTX 4869 bởi 2 người đàn ông áo đen, sau này được biết chúng là thành viên của Tổ chức Áo đen.', 2),
(5, 'Tonikaku Kawaii', '80000', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfbqoL7_mJR0kOYATY9ru5SaUUSLSPbQcVhA&s', 'Yuzaki Nasa, bị một chiếc xe tải đâm vào ngày thi vào trường trung học. Anh gặp và theo dõi một cô gái xinh đẹp vừa cứu anh, thổ lộ tình yêu của anh dành cho cô tại một trạm xe buýt. Cô gái ấy, Tsukuyomi Tsukasa, đồng ý trở thành bạn gái của anh, nhưng với điều kiện là họ phải kết hôn trước. Khi Nasa, trước đây đã quyết định không học cao trung, đến sinh nhật lần thứ 18, anh vẫn đang suy nghĩ về lời hứa vào ngày hôm đó. Đột nhiên, Tsukasa xuất hiện ở ngưỡng cửa nhà của anh với một tờ đơn kết hôn, bắt đầu mối quan hệ hôn nhân của họ. Mặc dù em gái nuôi của Tsukasa không chịu chấp nhận mối quan hệ này, Tsukasa vẫn dẫn Nasa đến gặp gia đình cô. Khi mối quan hệ của Nasa và Tsukasa phát triển, họ bắt đầu trở nên thân thiết hơn. Cặp đôi bắt đầu nắm tay, ôm nhau và hôn nhau cho đến Chương 14. Xuyên suốt các chương trước của manga, một nhân vật phụ tên là Arisugawa Aya, người đã phải lòng Nasa, tin rằng Nasa và Tsukasa chỉ đơn giản là thành viên trong gia đình, không kết hôn. Khi cô biết rằng họ là vợ chồng, cô đã phải chịu một cú sốc nhưng cuối cùng đành đồng ý và ủng hộ mối quan hệ của Nasa.', 3),
(6, 'Dragon Ball', '50000', 'https://product.hstatic.net/200000343865/product/dragon-ball-z-cuoc-chien-giua-cac-vi-than_bia_25b280637e55456da370269fcc2e66c8_master.jpg', 'Một cậu bé sơ sinh có đuôi khỉ được tìm thấy bởi một ông lão sống một mình trong rừng, ông đặt tên là Son Goku và xem đứa bé như là cháu của mình. Goku có sức mạnh vượt trội người thường, sau khi ông lão qua đời thì cậu sống một mình. Một ngày nọ Goku tình cờ gặp một cô gái tên là Bulma trên đường đi bắt cá về, Goku và Bulma đã cùng nhau truy tìm bảy viên ngọc rồng. Các viên ngọc rồng này chứa đựng một bí mật có thể triệu hồi một con rồng và ban điều ước cho ai sở hữu chúng. Trên cuộc hành trình dài đi tìm những viên ngọc rồng, họ gặp những người bạn và những đấu sĩ huyền thoại cũng như nhiều ác quỷ. Họ trải qua những khó khăn và học hỏi các chiêu thức võ thuật đặc biệt để tham gia thi đấu trong đại hội võ thuật thế giới được tổ chức hằng năm.', '4'),
(7, 'Mushoku Tensei', '80000', 'https://upload.wikimedia.org/wikipedia/vi/3/32/Mushoku_Tensei_1.jpeg', 'Một tên NEET 34 tuổi đã bị đuổi khỏi nhà sau cái chết của cha mẹ hắn vì không tổ chức tang lễ. Hắn ngăn chặn một nhóm người thiếu niên ra khỏi một chiếc xe tải đang chạy và đã đẩy một người trong nhóm người đó ra thành công trước khi hắn chết. Tỉnh dậy trong cơ thể của một đứa trẻ, hắn nhận ra mình đã được chuyển sinh tới thế giới của kiếm, phép thuật và các bộ tộc kỳ lạ. Trong khi hắn vẫn giữ lại cái tính biến thái (không hẳn), hắn quyết tâm sẽ trở nên thành công ở cuộc sống mới, với cái tên Rudeus Greyrat (một số nhân vật trong Mushoku Tensei có họ là tên con vật kết hợp với màu sắc). Bởi vì tính cách năng động và rèn luyện ở tuổi trẻ, Rudeus trở nên điêu luyện với phép thuật. Trong khi còn nhỏ, cậu trở thành học sinh của Roxy Migurdia, bạn của Sylphiette, và là giáo viên của Eris Boreas Greyrat. Sau đó, thảm họa dịch chuyển đã chia cắt mọi người trên khắp thế giới, và Rudeus quyết tâm sẽ đưa Eris về nhà. Cuộc hành trình của cậu bắt đầu, Rudeus nhận được lời khuyên từ một vật thể tự xưng là Nhân Thần và làm bạn với Ruijerd Supardia (Tộc nhân Superd). Sau khi đưa Eris về nhà thành công, sự hiểu nhầm của Rudeus đã khiến tim cậu tan nát.', 2),
(8, '', '', '', '', ''),
();

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `mobile` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `username`, `mobile`) VALUES
(2, 'vtdhnv@gmail.com', '123', 'vthdat', '0842596707'),
(5, 'test1@gmail.com', '123', 'dat', '0123456789'),
(6, '2254810175@vaa.edu.vn', '123', 'datvuthanh', '0842596707');
--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
