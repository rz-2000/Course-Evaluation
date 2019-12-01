package com.course.evaluation.service;

import java.util.ArrayList;
import java.util.List;

import com.course.evaluation.dao.EvaluationDao;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.po.Page;

public class EvaluationService {
    private EvaluationDao evaluationDao = new EvaluationDao();
    //添加
    public int add(Evaluation evaluation) {
        return evaluationDao.add(evaluation);
    }
    //find
    public Evaluation findById(Integer id){
        return evaluationDao.findById(id);
    }
    // 分页查询
    public Page<Evaluation> findByPage(Page<Evaluation> page) {
        return evaluationDao.findByPage(page);
    }
    //show
    public List<Evaluation> findAllEvaluationById(){
        return evaluationDao.findAllEvaluationById();
    }
    // 查询一共有多少条
    public long count() {
        return evaluationDao.count();
    }
    //修改
    public int chg(int id,Evaluation evaluation) {
        return evaluationDao.chg(id, evaluation);
    }
    //排行榜
    public ArrayList<Evaluation> ordersRank() {
        return evaluationDao.ordersRank();
    }

}
