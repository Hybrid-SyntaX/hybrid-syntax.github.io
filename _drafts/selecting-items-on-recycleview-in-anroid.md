---
layout: post
title:  "Selecting items on RecycleView in Android"
name: selecting-items-on-recycleview-in-anroid
author: Abbas Allahyari
date:   2016-04-21 23:02
permalink: /en/blog/selecting-items-on-recycleview-in-anroid.html
categories:
- Mobile Dev
- Android
tags: java android smartphone
lang: en
---

    private BoundViewHolder.OnItemSelectedListener mOnItemSelectedListener;

    @Override
    public BoundViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        ViewDataBinding viewDataBinding = DataBindingUtil.inflate(LayoutInflater.from(parent.getContext()),mLayoutId,parent, false);
        BoundViewHolder boundViewHolder = new BoundViewHolder(viewDataBinding);
        boundViewHolder.setOnSelectedListener(mOnItemSelectedListener);
        return boundViewHolder;
    }

    
    public void setOnItemSelectedListener(BoundViewHolder.OnItemSelectedListener onItemSelectedListener) 
    {
        mOnItemSelectedListener = onItemSelectedListener;
    }