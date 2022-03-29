import React, {Component} from 'react';
import axios from 'axios';

export default class CreateDocument extends Component {
    constructor(props) {
        super(props);
        this.onChangeSubject = this.onChangeSubject.bind(this);
        this.onChangeSubjectTitle = this.onChangeSubjectTitle.bind(this);
        this.onChangeDetail = this.onChangeDetail.bind(this);
        this.onChangeLecturers = this.onChangeLecturers.bind(this);
        this.onSubmit = this.onSubmit.bind(this);

        this.state = {
            Subject: '',
            SubjectTitle: '',
            Detail:'',
            Lecturers:''
        }
    }

    onChangeSubject(e) {
        this.setState({
            Subject: e.target.value
        });
    }

    onChangeSubjectTitle(e) {
        this.setState({
            SubjectTitle: e.target.value
        });
    }

    onChangeDetail(e) {
        this.setState({
            Detail: e.target.value
        });
    }
    onChangeLecturers(e) {
        this.setState({
            Lecturers: e.target.value
        });
    }

    onSubmit(e) {
        e.preventDefault();

        const obj = {
            Subject: this.state.Subject,
            SubjectTitle: this.state.SubjectTitle,
            Detail: this.state.Detail,
            Lecturers: this.state.Lecturers
        };
        axios.post('http://localhost:60444/documents/addDocument', obj)
            .then(res => console.log(res.data));

        this.setState({
            Subject: '',
            SubjectTitle: '',
            Detail: '',
            Lecturers:''
        })
    }

    render() {
        return (
            <div style={{marginTop: 10}}>
                <h3>Add New</h3>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <label>Subject: </label>
                        <input type="text" className="form-control"
                               value={this.state.Subject}
                               onChange={this.onChangeSubject}
                        />
                    </div>
                    <div className="form-group">
                        <label>SubjectTitle: </label>
                        <input type="text" className="form-control" value={this.state.SubjectTitle}
                               onChange={this.onChangeSubjectTitle}/>
                    </div>
                    <div className="form-group">
                        <label>Detail: </label>
                        <input type="text" className="form-control" value={this.state.Detail}
                               onChange={this.onChangeDetail}/>
                    </div>
                    <div className="form-group">
                        <label>Lecturers: </label>
                        <input type="text" className="form-control" value={this.state.Lecturers}
                               onChange={this.onChangeLecturers}/>
                    </div>
                    <div className="form-group">
                        <input type="submit" value="Register" className="btn btn-primary"/>
                    </div>
                </form>
            </div>
        )
    }
}