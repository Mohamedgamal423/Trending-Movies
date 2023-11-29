//
//  MainViewModel.swift
//  Trending Movies
//
//  Created by Mohamed on 28/11/2023.
//

import Foundation

class MainViewModel{
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numberOfSections() -> Int{
        return 1
    }
    func numberOfRows(in section: Int) -> Int{
        return self.dataSource?.results.count ?? 0
    }
    func getData(){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies {[weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let trendmovie):
                //print("number of movies ", trendmovie.results.count)
                self?.dataSource = trendmovie
                self?.mapCellData()
            case .failure(let err):
                print(err)
            }
        }
    }
    func mapCellData(){
        cellDataSource.value = self.dataSource?.results.compactMap({ MovieTableCellViewModel(movie: $0)})
    }
}
