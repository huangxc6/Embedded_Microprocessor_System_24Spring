from PIL import Image

def convert_jpg_to_ppm(input_file, output_file):
    # 打开JPG文件
    img = Image.open(input_file)
    
    # 将图像转换为RGB格式
    img = img.convert("RGB")
    
    # 获取图像尺寸
    width, height = img.size
    
    # 获取像素数据
    pixels = img.load()
    
    # 打开输出文件
    with open(output_file, 'w') as f:
        # 写入PPM文件头
        f.write("P3\n")
        f.write(f"{width} {height}\n")
        f.write("255\n")
        
        # 写入像素数据
        for y in range(height):
            for x in range(width):
                r, g, b = pixels[x, y]
                f.write(f"{r} {g} {b} ")
            f.write("\n")



def convert_ppm_to_jpg(input_file, output_file):
    # 打开PPM文件
    img = Image.open(input_file)
    
    # 保存为JPG格式
    img.save(output_file, 'JPEG')

# 示例使用

# convert_jpg_to_ppm("input.jpg", "input.ppm")
convert_ppm_to_jpg('output.ppm', 'output_without_openmp.jpg')

