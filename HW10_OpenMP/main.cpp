#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <omp.h>

// Function to load PPM image
bool loadPPM(const std::string& filename, std::vector<std::vector<int>>& image, int& rows, int& cols) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error: Could not open the file!" << std::endl;
        return false;
    }

    std::string format;
    file >> format;
    if (format != "P3") {
        std::cerr << "Error: Only P3 format is supported!" << std::endl;
        return false;
    }

    file >> cols >> rows;
    int max_val;
    file >> max_val;

    image.resize(rows, std::vector<int>(cols));

    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            int r, g, b;
            file >> r >> g >> b;
            image[i][j] = (r + g + b) / 3; // Convert to grayscale
        }
    }

    file.close();
    return true;
}

// Function to save PPM image
void savePPM(const std::string& filename, const std::vector<std::vector<int>>& image, int rows, int cols) {
    std::ofstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error: Could not open the file for writing!" << std::endl;
        return;
    }
    file << "P3\n" << cols << " " << rows << "\n255\n";
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            int val = image[i][j];
            file << val << " " << val << " " << val << "\n";
        }
    }
    file.close();
}

// Function to perform Sobel edge detection
void sobel_edge_detection(const std::vector<std::vector<int>>& src, std::vector<std::vector<int>>& dst, int rows, int cols) {
    dst.resize(rows, std::vector<int>(cols, 0));

    int Gx[3][3] = {
        {-1, 0, 1},
        {-2, 0, 2},
        {-1, 0, 1}
    };

    int Gy[3][3] = {
        {-1, -2, -1},
        {0,  0,  0},
        {1,  2,  1}
    };

#pragma omp parallel for
    for (int i = 1; i < rows - 1; ++i) {
        for (int j = 1; j < cols - 1; ++j) {
            int sumX = 0, sumY = 0;

            for (int k = -1; k <= 1; ++k) {
                for (int l = -1; l <= 1; ++l) {
                    sumX += src[i + k][j + l] * Gx[k + 1][l + 1];
                    sumY += src[i + k][j + l] * Gy[k + 1][l + 1];
                }
            }

            int magnitude = static_cast<int>(std::sqrt(sumX * sumX + sumY * sumY));
            dst[i][j] = (magnitude > 255) ? 255 : magnitude;
        }
    }
}

int main() {
    std::string input_file = "image/input.ppm";  // 替换为实际的输入文件路径
    std::string output_file = "image/output.ppm"; // 替换为实际的输出文件路径

    std::vector<std::vector<int>> src_image;
    int rows, cols;
    if (!loadPPM(input_file, src_image, rows, cols)) {
        return -1;
    }

    std::vector<std::vector<int>> dst_image;

    double start = omp_get_wtime();
    sobel_edge_detection(src_image, dst_image, rows, cols);
    double end = omp_get_wtime();

    std::cout << "Time taken with OpenMP: " << end - start << " seconds." << std::endl;
    //std::cout << "Time taken without OpenMP: " << end - start << " seconds." << std::endl;

    savePPM(output_file, dst_image, rows, cols);

    return 0;
}
